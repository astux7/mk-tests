require_relative './weather'

class Airport
  include Weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = nil)
    @capacity = capacity
    @planes = []
  end

  def capacity    
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)    
      @capacity = value.to_i > 0 ? value : DEFAULT_CAPACITY
  end

  def planes
    @planes ||= []
  end
#used to count capacity
  def planes_count
    planes.count
  end
 
  def park(plane)
    raise "There is no more parking place for planes" if full?
    plane.landed
    planes << plane
  end 

  def park_all(planes)
    planes.each {|plane| park(plane)}
  end

  def release_all
    planes.dup.each{|plane| 
       release(plane)
    }
  end 
  
  def release(plane)
    plane.take_off
    planes.delete(plane)
  end

  def full?
    planes_count == capacity
  end

  def permission_take_off_all(weather_now)
     release_all if self.check_weather_good?(weather_now)
  end

  def permission_take_off(plane,weather_now)
     release(plane) if self.check_weather_good?(weather_now) 
  end

  def permission_land(plane,weather_now)
     park(plane) if self.check_weather_good?(weather_now)
  end

  def permission_land_all(planes,weather_now)
     park_all(planes) if self.check_weather_good?(weather_now)
  end

end
