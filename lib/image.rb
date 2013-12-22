require_relative 'pixel'

class Image

  attr_reader :m, :n
  attr_accessor :pixels, :color

  def initialize(m, n, color = 'O')
    @m, @n =   m, n
    raise "Image must be in range 1 <= M,N <= 250 px" if !check_image_range?
    @pixels = Array.new(@m,Array.new(@n,''))
    create_image(color)
  end


  

  def pixels_count
    counter = 0
    for x in 0..@m-1
      for y in 0..@n-1
        counter +=1
      end
    end
    counter
  end

  def create_image(color)
    for x in 0..@m-1
      for y in 0..@n-1
        @pixels[x][y] = Pixel.new(x,y,color)
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
    for x in 0..@m-1
      for y in 0..@n-1
        @pixels[x][y].color = color
      end
    end
    @pixels
  end

  def inspect
   format_string = ""
    for xx in 0..@m-1
      for yy in 0..@n-1
        format_string += @pixels[xx][yy].color
      end
      format_string += '\n' 
    end 
    print format_string.chomp('\n')
  end
end