require_relative 'pixel'

class Image

  attr_accessor :pixels, :m, :n

  def initialize
    @m, @n, @pixels = 0, 0, []
  end
  #Vertical coordinates line draw
  def prepare_vertical_line(x1, x2, x3)
    result = []
    x2.upto(x3){|iter| result << [x1,iter] }
    result
  end
  #colored Vertical line
  def vertical_line(x1, x2, x3, color)
    coordinates = prepare_vertical_line(x1, x2, x3)
    colored_pixels(coordinates, color)
  end
  #Horizontal coordinates line draw
  def prepare_horizontal_line(x1, x2, x3)
    result = []
    x1.upto(x2){|iter| result << [iter,x3] }
    result
  end
  #colored Horizontal line
  def horizontal_line(x1, x2, x3, color)
    coordinates = prepare_horizontal_line(x1, x2, x3)
    colored_pixels(coordinates, color)
  end
  # color single pixel
  def colored_pixel(x,y,color)
    @pixels.each{|px| px.color = color if px.x == x && px.y == y }
  end
  #color array of pixels
  def colored_pixels(pixels_group, color)
    pixels_group.each{|px| colored_pixel(px[0], px[1], color) }
  end
  #coloring pixels as giving pixels object array but not coordinates
  def colored_pixels_object(group_pixels, color)
    group_pixels.each{|px| colored_pixel(px.x, px.y, color) }
  end
  #get the color of pixel of giving coordinates
  def find_pixel_color(x,y)
    @pixels.each{|px| return px.color if x == px.x && px.y == y }
  end
  #get the same color pixels in image
  def same_color_pixels(x,y)
    @pixels.select{|px| px.color == find_pixel_color(x,y) }
  end
  #select area R to fill pixels with color
  def select_area_to_fill(x,y,color)
     full_array = prepare_area_to_fill(x, y)
     colored_pixels_object(full_array, color)
  end
  #select pixels for area
  def prepare_area_to_fill(x,y)
    all_pixels, group_pixels = [], same_color_pixels(x,y)
    group_pixels.each{|px| all_pixels << find_pixel_neighbors(px.x,px.y)}
    all_pixels.flatten(1).uniq
  end
  #if x exist in image
  def exist_x?(x)
    return x >=1 && x <= @n ? true : false
  end
  #if y exist in Image
  def exist_y?(y)
    return y >= 1 && y <= @m ? true : false
  end
  #if both coordinates is in range of image
  def exist_x_y?(x,y)
    return exist_y?(y) && exist_x?(x) ? true : false
  end
  #finds pixel neighbors coordinates
  def find_pixel_neighbors(x, y)
    result, template = [],[[x-1,y-1],[x,y-1],[x+1,y-1],[x-1,y],[x,y],[x+1,y],[x-1,y+1],[x,y+1],[x+1,y+1]]
    template.each{|coordinates| 
      index = find_pixel_index(coordinates[0],coordinates[1]) 
      result << @pixels[index] if index
    }
    result
  end
  #find the index im pixels by gave coordinates of pixel
  def find_pixel_index(x, y)
    @pixels.find_index{|px| px.x == x && px.y == y} if exist_x_y?(x,y)
  end
  #counting image pixels
  def pixels_count
    @pixels.count
  end
  #creating NxM image with color 
  def create_image(n, m, color = 'O')
    @m, @n = m, n
    raise "Image must be in range 1 <= M,N <= 250 px" if !check_image_range?
    initializing_image_pixels(color)
  end
  #init image pixels
  def initializing_image_pixels(color)
    for y in 1..@m
      for x in 1..@n 
        @pixels << Pixel.new(x,y,color)
      end
    end
  end
  #check if image in range
  def check_image_range?
    return check_range?(@m) && check_range?(@n) ? true : false
  end
  #check if M or N in range
  def check_range?(size)
    return size > 250 || size < 1 ? false : true
  end
  #clear table of image
  def clear(color = 'O')
    @pixels = @pixels.each{|px| px.color = color}
  end
  # show current image
  def inspect
    output = ""
    @pixels.each{|px| output += px.x % @n == 0 ? px.color+"\n" : px.color} 
    print output
  end
end