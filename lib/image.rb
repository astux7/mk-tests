require_relative 'pixel'
require_relative 'error_handler'

class Image
  
  include ErrorHandler
  attr_accessor :pixels, :m, :n

  def initialize
    @m, @n, @pixels = 0, 0, []
  end
#=================================================================================
  #creating NxM image with color 
  def create_image(n, m, color = 'O')
    prepare_image_creation(m, n, color) 
    initializing_image_pixels(color)
  end
  # color single pixel
  def colored_pixel(x, y, color)
    x, y = check_coordinate(x, @n), check_coordinate(y, @m)
    check_color(color)
    px = @pixels[(x-1)+(y-1)*@n]
    px.color = color
  end
  #colored Vertical line
  def vertical_line(x1, x2, x3, color)
    params = check_vertical_line_params(x1, x2, x3, color)
    coordinates = prepare_vertical_line(params[0], params[1], params[2])
    colored_pixels_by_coordinates(coordinates, color)
  end
  #colored Horizontal line
  def horizontal_line(x1, x2, x3, color)
    params = check_horizontal_line_params(x1, x2, x3, color)
    coordinates = prepare_horizontal_line(params[0], params[1], params[2])
    colored_pixels_by_coordinates(coordinates, color)
  end
  #select area R to fill pixels with color
  def select_area_to_fill(x, y, color)
    coords = check_area_paprametres(x, y, color)
    full_array = prepare_area_to_fill(coords[0], coords[1], color)
    colored_pixels_groups(full_array, color) if !full_array.empty?
  end
  #clear table of image
  def clear(color = 'O')
    check_color(color) if color.eql?('O')
    @pixels.each{|px| px.color = color }
  end
  # show current image
  def inspect
    output = ""
    @pixels.each{|px| output += px.x % @n == 0 ? px.color + "\n" : px.color }
    print output
  end
 #============================================================================= 
  #Vertical coordinates line draw
  def prepare_vertical_line(x1, x2, x3)
    result = []
    x2.upto(x3){|iter| result << [x1, iter] }
    result
  end
  #check vertical line coordinates and color
  def check_vertical_line_params(x1, x2, x3, color)
    coords = check_line_coordinates(x1, x2, x3)
    x_bigger_y(x2, x3)
    check_color(color)
    coords
  end
  #Horizontal coordinates line draw
  def prepare_horizontal_line(x1, x2, x3)
    result = []
    x1.upto(x2){|iter| result << [iter, x3] }
    result
  end
  #check line coordinates
  def check_line_coordinates(x1, x2, x3)
    [check_coordinate(x1, @m), check_coordinate(x2, @n), check_coordinate(x3, @n)]
  end
  #check horizontal line coordinates and color
  def check_horizontal_line_params(x1, x2, x3, color)
    coords = check_line_coordinates(x1, x2, x3)
    x_bigger_y(x1, x2)
    check_color(color)
    coords
  end 
  #coloring pixels as giving array with px coordinates
  def colored_pixels_by_coordinates(group_pixels, color)
    group_pixels.each{|px| 
      px = @pixels[(px[0]-1)+(px[1]-1)*@n]
      px.color = color
    }
  end
  #coloring pixels as giving pixels object array but not coordinates
  def colored_pixels_groups(group_pixels, color)
    group_pixels.each{|px| px.color = color }
  end
  #get the color of pixel of giving coordinates
  def find_pixel_color(x, y)
    px = @pixels[(x-1)+(y-1)*@n]
    px.color
  end
  #get the same color pixels in image
  def same_color_pixels(x, y)
    color = find_pixel_color(x,y) 
    @pixels.select{|px| px.color == color }
  end
  #select area R to fill pixels with color
  def check_area_paprametres(x, y, color)
    x, y = check_coordinate(x, @n), check_coordinate(y, @m)
    color = check_color(color)
    [x, y]
  end
  #select pixels for area
  def prepare_area_to_fill(x, y, color)
    group_pixels = same_color_pixels(x, y)
    return group_pixels if group_pixels.count == pixels_count
    group_pixels.each{|px| find_pixel_neighbors(px.x, px.y, color) } 
    return []
  end
  #if x or y exist in image
  def exist_coordinate?(coord, size)
    return coord >=1 && coord <= size ? true : false
  end
  #if both coordinates is in range of image
  def exist_x_y?(x,y)
    return exist_coordinate?(y, @m) && exist_coordinate?(x, @n) ? true : false
  end
  #finds pixel neighbors coordinates
  def find_pixel_neighbors(x, y, color)
    neighbors = [[x-1,y-1],[x,y-1],[x+1,y-1],[x-1,y],[x,y],[x+1,y],[x-1,y+1],[x,y+1],[x+1,y+1]]
    prepare_pixel_neighbors(neighbors, color)
  end
  #color pixel neighbors
  def prepare_pixel_neighbors(template_neighbors, color)
    template_neighbors.each{|coordinates| 
      index = find_pixel_index(coordinates[0], coordinates[1]) 
      @pixels[index].color = color if !index.nil?
    }
  end
  #find the index im pixels by gave coordinates of pixel
  def find_pixel_index(x, y)
    (x-1)+(y-1)*@n if exist_x_y?(x,y)
  end
  #counting image pixels
  def pixels_count
    @pixels.count
  end
  #prepare image to create
  def prepare_image_creation(m, n, color) 
    check_image_range(m, n)
    check_color(color) if color != 'O'
    @m, @n = m.to_i, n.to_i
  end
  #init image pixels
  def initializing_image_pixels(color)
    for y in 1..@m
      for x in 1..@n 
        @pixels << Pixel.new(x,y,color)
      end
    end
  end

end