module ErrorHandler

  def check_color(color)
    color_template = /\A[A-Z]\z/
    raise "Color not valid" unless color_template.match(color.to_s)
    return color
  end

  def check_coordinate(coordinate, size = 250)
    raise "Coordinate not valid" unless coordinate.to_i >= 1 && coordinate.to_i <= size
    return coordinate 
  end

  def check_image_range(m, n) 
    raise "Image must be in range 1 <= M,N <= 250 px" if !(check_coordinate(m) && check_coordinate(n))
    true
  end
  
  def x_bigger_y(x,y)
    raise "Bad Coodinates range" if x > y
    true
  end

  def check_arguments_number(command, number)
    raise "Arguments missing in Command" if number != command.count
    true
  end

  def check_if_positive_integers(number_list)
    number_list.each{|number| 
      raise "This is not correct giving parameters" if number.to_i < 1 || number.to_i > 250 
    }
    true
  end

end