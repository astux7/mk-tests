class Plane

  def initialize
    @flying = true
  end

  def status
    return "flying" if @flying
    return "landed" 
  end

  def flying?
      @flying
  end

  def broken
    @flying = false
  end

  def landed
    @flying = false
  end

  def fixed
    @flying = true
  end

  def in_the_air
    fixed and takes_off
  end

  def takes_off
    @flying = true
  end

end