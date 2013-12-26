require_relative 'error_handler'

class Pixel

  include ErrorHandler

  attr_reader :x, :y, :color

  def initialize(x = nil, y = nil, color = 'O')
    @x = check_coordinate(x)
    @y = check_coordinate(y)
    @color = check_color(color)
  end

  def color=(color)
    @color = check_color(color)
  end
end
