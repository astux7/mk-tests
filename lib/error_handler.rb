module ErrorHandler

  def check_color(color)
    color_template = /\A[A-Z]\z/
    raise "\nColor not valid\n" unless color_template.match(color.to_s)
    return color
  end

  def check_coordinate(coordinate, size = 250)
    raise "\nCoordinate not valid\n" unless coordinate.to_i >= 1 && coordinate.to_i <= size
    return coordinate.to_i
  end

  def check_image_range(m, n) 
    raise "\nImage must be in range 1 <= M,N <= 250 px\n" if !(check_coordinate(m) && check_coordinate(n))
    true
  end
  
  def x_bigger_y(x,y)
    raise "\nBad Coodinates range\n" if x > y
    true
  end

  def check_arguments_number(command, number)
    raise "\nArguments missing in Command\n" if number != command.count
    true
  end

  def check_if_positive_integers(number_list)
    number_list.each{|number| 
      raise "\nThis is not correct commands parameters\n" if number.to_i < 1 || number.to_i > 250 
    }
    true
  end

end