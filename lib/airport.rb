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
    @bikes ||= []
  end
#used to count capacity
  def planes_count
    planes.count
  end
 
  def park(plane = nil)
    return false if plane == nil
    raise "There is no more parking place for planes" if full?
    plane.landed
    planes << plane
  end 

  def park_all(planes = nil)
    planes.each do |plane|
      park(plane)
    end
  end

  def release(plane = nil)
    if plane != nil
      plane.takes_off
      planes.delete(plane)
    else
      planes.dup.each{|plane| 
        plane.takes_off
        planes.delete(plane)
      }
    end
  end 

  def full?
    planes_count == capacity
  end

  def permission_take_off(weather_now)
     release unless weather_now == "stormy"
  end

  def permission_land(weather_now,plane)
     park(plane) if weather_now == "sunny"
  end

  def permission_land_all(weather_now,planes)
     park_all(planes) if weather_now == "sunny"
  end

end