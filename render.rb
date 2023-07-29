def render_dots_on_circle(center_x, center_y, radius, min_distance, max_distance, num_dots)
  dots = []

  if num_dots == 1
    distance = (min_distance + max_distance) / 2.0
    angle = 0
    x = center_x + distance * Math.cos(angle)
    y = center_y + distance * Math.sin(angle)
    dots << [x, y]
  else
    (0...num_dots).each do |i|
      angle = i * 360.0 / num_dots
      distance = min_distance + i * (max_distance - min_distance) / (num_dots - 1)
      x = center_x + distance * Math.cos(angle * Math::PI / 180)
      y = center_y + distance * Math.sin(angle * Math::PI / 180)
      dots << [x, y]
    end
  end

  return dots
end

# Example usage:
center_x = 0
center_y = 0
radius = 100
min_distance = 30
max_distance = 70
num_dots = 10

dots_on_circle = render_dots_on_circle(center_x, center_y, radius, min_distance, max_distance, num_dots)
dots_on_circle.each do |dot|
  puts "Dot at (#{dot[0]}, #{dot[1]})"
end
