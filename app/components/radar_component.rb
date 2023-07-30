# frozen_string_literal: true

class RadarComponent < ViewComponent::Base
  def initialize(blips:, quadrant:)

    @dot_radius = 6
    @image_size = 256

    @radar_center = radar_center_for(quadrant, @image_size)

    stages = [
      { name: :adopt, p: 0.3333 },
      { name: :trial, p: 0.3333 },
      { name: :assess, p: 0.16666 },
      { name: :hold, p: 0.16666 }
    ]

    @stage_ranges = generate_ranges(stages, @image_size)

    adopt = blips.select(&:stage_adopt?)
    trial = blips.select(&:stage_trial?)
    assess = blips.select(&:stage_assess?)
    hold = blips.select(&:stage_hold?)

    @blips = assess
    @dots = []
    @dots += place_blips(adopt, @stage_ranges[0])
    @dots += place_blips(trial, @stage_ranges[1])
    @dots += place_blips(assess, @stage_ranges[2])
    @dots += place_blips(hold, @stage_ranges[3])
  end

  def radar_center_for(quadrant, image_size)
    case quadrant
    when :tl
      [
        image_size,
        image_size
      ]
    when :tr
      [
        0,
        image_size
      ]
    when :bl
      [
        image_size,
        0
      ]
    when :br
      [
        0,
        0
      ]
    else
      raise ArgumentError, "Not a valid quadrant #{quadrant}"
    end
  end

  def generate_ranges(stages, image_size)
    ranges = []
    last_edge = 0
    stages.each do |stage|
      next_edge = last_edge + stage[:p] * image_size
      ranges << [last_edge, next_edge]
      last_edge = next_edge
    end
    ranges
  end

  def degrees_to_radians(degrees)
    Math::PI * degrees / 180.0
  end

  def place_blips(blips, range)
    middle = (range.first + range.last) / 2
    radial_deviation = (range.last - range.first) / 2 * 0.7
    angle_step = degrees_to_radians(90) / (blips.length + 1)
    angular_deviation = angle_step * 0.7
    @angles = 0.upto(blips.length - 1).map { |i| angle_step * (i + 1) }
    results = []
    polarity = 1
    blips.each_with_index do |blip, i|
      angular_noise = blip.angular_noise * angular_deviation
      a = @angles[i] + angular_noise

      radial_noise = blip.radial_noise * radial_deviation * polarity
      r = middle + radial_noise

      x = r * Math.cos(a)
      y = @image_size - (r * Math.sin(a))
      results << [x, y]
      polarity *= -1
    end
    results
  end
end
