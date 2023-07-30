# frozen_string_literal: true

class RadarComponent < ViewComponent::Base
  def initialize(blips:, title: nil, quadrant: :tr, image_size: 512)
    @dot_radius = 20
    @image_size = image_size
    @title = title
    @radar_center = radar_center_for(quadrant, @image_size)
    @borders = get_borders(quadrant)
    @stage_ranges = generate_ranges(@image_size)
    guide = get_guides(quadrant, @image_size)

    adopt = blips.select(&:stage_adopt?)
    trial = blips.select(&:stage_trial?)
    assess = blips.select(&:stage_assess?)
    hold = blips.select(&:stage_hold?)

    @dots = []
    @dots += place_blips(adopt, @stage_ranges[0], guide, @dot_radius)
    @dots += place_blips(trial, @stage_ranges[1], guide, @dot_radius)
    @dots += place_blips(assess, @stage_ranges[2], guide, @dot_radius)
    @dots += place_blips(hold, @stage_ranges[3], guide, @dot_radius)

    case quadrant
    when :tl
      @title_display = 'top-4 left-4'
    when :tr
      @title_display = 'top-4 right-4'
    when :bl
      @title_display = 'bottom-4 left-4'
    when :br
      @title_display = 'bottom-4 right-4'
    end
  end

  def get_guides(quadrant, image_size)
    case quadrant
    when :tl
      OpenStruct.new(
        {
          x_offset: image_size,
          y_offset: image_size,
          x_direction: -1,
          y_direction: -1
        }
      )
    when :tr
      OpenStruct.new(
        {
          x_offset: 0,
          y_offset: image_size,
          x_direction: 1,
          y_direction: -1
        }
      )
    when :bl
      OpenStruct.new(
        {
          x_offset: image_size,
          y_offset: 0,
          x_direction: -1,
          y_direction: 1
        }
      )
    when :br
      OpenStruct.new(
        {
          x_offset: 0,
          y_offset: 0,
          x_direction: 1,
          y_direction: 1
        }
      )
    else
      raise ArgumentError, "Not a valid quadrant #{quadrant}"
    end
  end

  def get_borders(quadrant)
    case quadrant
    when :tl
      'border-r border-b'
    when :tr
      'border-l border-b'
    when :bl
      'border-r border-t'
    when :br
      'border-l border-t'
    else
      raise ArgumentError, "Not a valid quadrant #{quadrant}"
    end
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

  def generate_ranges(image_size)
    stages = [
      { name: :adopt, p: 0.3333 },
      { name: :trial, p: 0.3333 },
      { name: :assess, p: 0.16666 },
      { name: :hold, p: 0.16666 }
    ]
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

  def place_blips(blips, range, guide, dot_radius)
    middle = (range.first + range.last) / 2
    radial_deviation = (range.last - range.first - dot_radius) / 2 * 0.8
    angle_step = degrees_to_radians(90) / (blips.length + 1)
    angular_deviation = angle_step * 0.7
    @angles = 0.upto(blips.length - 1).map { |i| angle_step * (i + 1) }
    results = []
    polarity = 1
    guide =

      blips.each_with_index do |blip, i|
        angular_noise = blip.angular_noise * angular_deviation
        a = @angles[i] + angular_noise

        radial_noise = blip.radial_noise * radial_deviation
        r = middle + radial_noise

        x = guide.x_offset + guide.x_direction * r * Math.cos(a)
        y = guide.y_offset + guide.y_direction * r * Math.sin(a)

        results << [x, y, blip]
        polarity *= -1
      end
    results
  end
end
