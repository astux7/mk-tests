require_relative 'pixel'

class Image

  #attr_reader 
  attr_accessor :pixels, :color,:m, :n

  def initialize
    @m, @n, @pixels = 0, 0, []
  end

  def color_the_pixel(x,y,color)
    @pixels = @pixels.each{|px| 
      # print px if px.x == x && px.y == y
       px.color = color if px.x == x.to_i && px.y == y.to_i
    }
  end

  def color_pixels(coord, color)
    coord.each{|pxs|
      color_the_pixel(pxs[0],pxs[1],color)
    }
  end
  
   def color_pixels_object(coord, color)
    coord.each{|pxs|
      color_the_pixel(pxs.x,pxs.y,color)
    }
  end

  def draws_image_lines(coord, color)
     coord.each{|line|
       color_the_pixel(line[0],line[1],color)
     }
  end

  def get_pixel_color(x,y)
    @pixels.each{|px| 
      return px.color if x == px.x && px.y == y 
    }
  end

  def select_same_color_pixels(x,y)
      color_fill, selection_same_color = get_pixel_color(x,y), []
      selection_same_color = @pixels.select{|px|
        px.color == color_fill
      }
      selection_same_color
  end

  def select_area_to_fill(x,y)
    all_px = []
    pxs = select_same_color_pixels(x,y)
    pxs.each{|px|
      all_px << get_pixel_neighbors_coord(px.x,px.y)
    }
    all_px.uniq
  end

  def exist_x?(x)
    return x>=1 && x <=@n ? true : false
  end

  def exist_y?(y)
    return y >=1 && y <=@m ? true : false
  end

  def exist_x_y?(x,y)
    return exist_y?(y) && exist_x?(x) ? true : false
  end

  def get_pixel_neighbors_coord(x,y)
    result = []
    template = [[x-1,y-1],[x,y-1],[x+1,y-1],[x-1,y],[x,y],[x+1,y],[x-1,y+1],[x,y+1],[x+1,y+1]]

    template.each{|coord| 

      index = @pixels.find_index{|px| px.x == coord[0] && px.y == coord[1]} if exist_x_y?(coord[0],coord[1])
      result << @pixels[index] if !index.nil? 
    }
    result
  end

  def pixels_count
    @pixels.count
  end

  def create_image(n, m, color = 'O')
    @m, @n = m, n
    raise "Image must be in range 1 <= M,N <= 250 px" if !check_image_range?
    for i in 1..@m
      for j in 1..@n
        @pixels << Pixel.new(j,i,color)
      end
    end
    @pixels
  end

  def check_image_range?
    return check_range?(@m) && check_range?(@n) ? true : false
  end

  def check_range?(size)
    return size > 250 || size < 1 ? false : true
  end
  
  def clear(color = 'O')
    @pixels = @pixels.each{|px| px.color = color}
  end

  def inspect
    format_string, xx, yy= "", 0, 0
      @pixels.each{ |px|
        format_string += px.color 
        format_string += "\n" if px.x % @n == 0 
    } 
    print format_string#.chomp("\n")
  end
end