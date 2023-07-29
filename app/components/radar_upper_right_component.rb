# frozen_string_literal: true

class RadarUpperRightComponent < ViewComponent::Base
  def initialize(blips:)
    @dot_radius = 10
    @image_size = 512
    
    stages = [
      { name: :adopt, p: 0.3333, two_bands: true },
      { name: :trial, p: 0.3333, two_bands: true },
      { name: :assess, p: 0.16666, two_bands: false },
      { name: :hold, p: 0.16666, two_bands: false }
    ]

    @stage_ranges = generate_ranges(stages, @image_size)

    adopt = blips.select { |blip| blip.stage_adopt? }
    trial = blips.select { |blip| blip.stage_trial? }
    assess = blips.select { |blip| blip.stage_assess? }
    hold = blips.select { |blip| blip.stage_hold? }

    @blips = assess
    @dots = []
    @dots += place_blips(adopt, @stage_ranges[0], stages[0][:two_bands])
    @dots += place_blips(trial, @stage_ranges[1], stages[1][:two_bands])
    @dots += place_blips(assess, @stage_ranges[2], stages[2][:two_bands])
    @dots += place_blips(hold, @stage_ranges[3], stages[3][:two_bands])

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

  def place_blips(blips, range, is_two_bands)
    if !is_two_bands
      place_band(blips, range)
    else
      place_band(blips, range)
    end
  end

  def degrees_to_radians(degrees)
    Math::PI * degrees / 180.0
  end
  

  def place_band(blips, range)
    middle = (range.first + range.last) / 2
    deviation = (range.last - range.first) / 2 * 0.6
    angle_step = degrees_to_radians(90) / ( blips.length + 1 ) 
    @angles = 0.upto(blips.length - 1).map { |i| angle_step * (i + 1) }
    results = []
    polarity = 1
    blips.each_with_index do |blip, i|
      radial_noise = rand * deviation * polarity
      r = middle + radial_noise
      x = r * Math.cos(@angles[i])
      y = @image_size - (r * Math.sin(@angles[i]))
      results << [x, y]
      polarity *= -1
    end
    results
  end

  # def generate_non_overlapping_dots_on_quadrant(stage:, num_dots:)
  #   middle = (stage.first + stage.last) / 2
  #   deviation = (stage.last - stage.first) / 2    
  #   image_size = 512
  #   radius = image_size / 2
  #   circle_center_x = circle_center_y = image_size / 2
  #   circle_quadrant_size = image_size / 2

  #   num_dots = 1000 # Adjust this number to control the density of dots
  #   min_distance_between_dots = @dot_radius * 2 # Minimum distance to avoid overlapping
  #   max_attempts = 1000 # Maximum attempts to find a non-overlapping position

  #   # Function to check if a point is within the specified circle quadrant
  #   within_specified_quadrant = lambda do |x, y|
  #     case quadrant
  #     when 1
  #       x >= circle_center_x && y <= circle_center_y
  #     when 2
  #       x <= circle_center_x && y <= circle_center_y
  #     when 3
  #       x <= circle_center_x && y >= circle_center_y
  #     when 4
  #       x >= circle_center_x && y >= circle_center_y
  #     else
  #       false
  #     end
  #   end

  #   # Function to check if a new dot is too close to any existing dot
  #   too_close_to_existing_dot = lambda do |new_x, new_y, dots|
  #     dots.each do |dot_x, dot_y|
  #       distance = Math.sqrt((new_x - dot_x)**2 + (new_y - dot_y)**2)
  #       return true if distance < min_distance_between_dots
  #     end
  #     false
  #   end

  #   # Array to store the coordinates of the dots
  #   dots_coordinates = []

  #   # Generate non-overlapping random dots within the specified circle quadrant
  #   num_dots.times do
  #     attempts = 0

  #     loop do
  #       x = rand(circle_quadrant_size) + circle_center_x
  #       y = rand(circle_quadrant_size) + circle_center_y

  #       if within_specified_quadrant.call(x, y) && !too_close_to_existing_dot.call(x, y, dots_coordinates)
  #         dots_coordinates << [x, y]
  #         break
  #       end

  #       attempts += 1
  #       break if attempts >= max_attempts
  #     end
  #   end

  #   dots_coordinates
  # end
end
