# frozen_string_literal: true

class RadarQuadrentComponent < ViewComponent::Base
  def initialize(quadrant:, num_dots:)
    @quadrant = quadrant
    @num_dots = num_dots

    min_distance = 0
    max_distance = 512

    @dots = render_dots_on_circle_quadrant(min_distance, max_distance, @num_dots, @quadrant)
  end

  def render_dots_on_circle_quadrant(min_distance, max_distance, num_dots, quadrant, dot_size: 35, radius: 512)
    center_x = 256 # Half of 512
    center_y = 256 # Half of 512

    dots = []

    if num_dots == 1
      distance = (min_distance + max_distance) / 2.0
      angle = 0
      x = center_x + distance * Math.cos(angle)
      y = center_y + distance * Math.sin(angle)
      dots << [x, y]
    else
      quadrant_angle_range = 90.0
      angle_step = quadrant_angle_range / (num_dots - 1)

      start_angle = case quadrant
                    when 1
                      0
                    when 2
                      90
                    when 3
                      180
                    when 4
                      270
                    else
                      raise 'Invalid quadrant. Should be 1, 2, 3, or 4.'
                    end

      radius_adjusted = radius - (dot_size / 2.0)

      (0...num_dots).each do |i|
        angle = start_angle + i * angle_step
        distance = min_distance + i * (max_distance - min_distance) / (num_dots - 1)

        # Adjusting for the 512x512 box per quadrant
        x = center_x + ((radius_adjusted + distance) * Math.cos(angle * Math::PI / 180) * 512 / (2 * radius))
        y = center_y + ((radius_adjusted + distance) * Math.sin(angle * Math::PI / 180) * 512 / (2 * radius))

        dots << [x, y]
      end
    end

    dots
  end
end
