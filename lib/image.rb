require_relative 'pixel'

class Image

  attr_reader :m, :n
  attr_accessor :pixels, :color, :imgs

  def initialize(m, n, color = 'O')
    @m, @n = m, n
    raise "Image must be in range 1 <= M,N <= 250 px" if !check_image_range?
    @pixels = []
    create_image(color)
  end

  def color_the_pixel(x,y,color)
    @pixels.each{|px| 
       px.color = color if px.x == x && px.y == y
    }
  end

  def draws_image_lines(coord, color)
     coord.each{|line|
       color_the_pixel(line[0],line[1],color)
     }
  end

  def pixels_count
    @pixels.count
  end

  def create_image(color)
    for i in 1..@m
      for j in 1..@n
        @pixels << Pixel.new(i,j,color)
      end
    end
    @pixels
  end

  def check_image_range?
    return true if check_range?(@m) && check_range?(@n)
    false
  end

  def check_range?(size)
    return false if size > 250 || size < 1
    true
  end
  
  def clear(color = 'C')
    @pixels = @pixels.each{|px| px.color = color}
  end

  def inspect
   format_string, xx ,yy= "", 0, 0
      @pixels.each{ |px|
      format_string += px.color 
      format_string += '\n' if px.y % @n == 0 
    } 
    print format_string.chomp('\n')
  end
end