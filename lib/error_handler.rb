module ErrorHandler

  def check_color?(color)
    color_template = /\A[A-Z]\z/
    raise "\nColor not valid\n" unless color_template.match(color.to_s)
    return true
  end

  def is_numeric?(number) 
    number_tempate = /\A\+?0*[1-9]\d*\Z/
    raise "\nNumber is not correct! \n" unless number_tempate.match(number.to_s)
    true
  end

  def check_coordinate(coordinate, size = 250)
    raise "\nCoordinate not valid\n" unless is_numeric?(coordinate) && coordinate.to_i <= size
    return coordinate.to_i
  end

  def check_image_range?(m, n) 
    raise "\nImage must be in range 1 <= M,N <= 250 px\n" if !(check_coordinate(m) && check_coordinate(n))
    true
  end
  
  def x_bigger_y?(x,y)
    raise "\nBad Coodinates range\n" if x > y
    true
  end

  def check_arguments_number?(command, number)
    raise "\nArguments missing in Command\n" if number != command.count
    true
  end

  def check_if_positive_integers?(number_list)
    number_list.each{|number| 
      check_coordinate(number)
    }
    true
  end

end