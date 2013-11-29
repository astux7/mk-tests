class Plane

  def initialize
    @flying = true
  end

  def status
    return "flying" if @flying
    "landed" 
  end

  def flying
      status
  end

  def landed
    @flying = false
    status
  end

  def take_off
    @flying = true
    status
  end

end