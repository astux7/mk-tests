require_relative 'pixel'

class Image

  attr_reader :m, :n
  attr_accessor :pixels, :c

  def initialize(m, n, c)
    raise "Image must be in range 1 <= M,N <= 250 px" if !check_image_range?(m,n)
    @pixels = []
    for x in 1..m
      for y in 1..n
        @pixels << Pixel.new(x,y,c)
      end
    end
  end

  def check_image_range?(m,n)
    return true if check_range?(m) && check_range?(n)
    false
  end

  def check_range?(size)
    return false if size > 250 || size < 1
    true
  end


end