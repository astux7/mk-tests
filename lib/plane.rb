class Plane

  def initialize
    @flying = true
  end

  def status
    return "flying" if @flying
    "landed" 
  end

  def flying
      @flying
  end

  def broken
    @flying = false
  end

  def landed
    @flying = false
    status
  end

  def fixed
    @flying = true
  end

  def in_the_air
    fixed
    takes_off
  end

  def takes_off
    @flying = true
    status
  end

end