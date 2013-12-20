
class Pixel
  def initialize(x=nil,y=nil,color=nil)
    @x = x
    @y = y
    @color = color
  end
  attr_reader :x, :y
  attr_accessor :color
end