# frozen_string_literal: true

class RadarQuadrentComponent < ViewComponent::Base
  def initialize(quadrant:, num_dots:)
    @quadrant = quadrant
    @num_dots = num_dots
    @dot_radius = 35 / 2

    min_distance = 100
    max_distance = 200

    @dots = generate_non_overlapping_dots_on_quadrant(2)

    logger.debug @dots
  end

  def generate_non_overlapping_dots_on_quadrant(quadrant)
    image_size = 512
    radius = image_size / 2
    circle_center_x = circle_center_y = image_size / 2
    circle_quadrant_size = image_size / 2

    num_dots = 1000 # Adjust this number to control the density of dots
    min_distance_between_dots = @dot_radius * 2 # Minimum distance to avoid overlapping
    max_attempts = 1000 # Maximum attempts to find a non-overlapping position

    # Function to check if a point is within the specified circle quadrant
    within_specified_quadrant = lambda do |x, y|
      case quadrant
      when 1
        x >= circle_center_x && y <= circle_center_y
      when 2
        x <= circle_center_x && y <= circle_center_y
      when 3
        x <= circle_center_x && y >= circle_center_y
      when 4
        x >= circle_center_x && y >= circle_center_y
      else
        false
      end
    end

    # Function to check if a new dot is too close to any existing dot
    too_close_to_existing_dot = lambda do |new_x, new_y, dots|
      dots.each do |dot_x, dot_y|
        distance = Math.sqrt((new_x - dot_x)**2 + (new_y - dot_y)**2)
        return true if distance < min_distance_between_dots
      end
      false
    end

    # Array to store the coordinates of the dots
    dots_coordinates = []

    # Generate non-overlapping random dots within the specified circle quadrant
    num_dots.times do
      attempts = 0

      loop do
        x = rand(circle_quadrant_size) + circle_center_x
        y = rand(circle_quadrant_size) + circle_center_y

        if within_specified_quadrant.call(x, y) && !too_close_to_existing_dot.call(x, y, dots_coordinates)
          dots_coordinates << [x, y]
          break
        end

        attempts += 1
        break if attempts >= max_attempts
      end
    end

    dots_coordinates
  end
end
