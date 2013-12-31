class Pixel

  attr_reader :x, :y
  attr_accessor :color

  def initialize(x, y, color = 'O')
    @x = x
    @y = y
    @color = color
  end
end
