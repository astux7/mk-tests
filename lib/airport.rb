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
    planes << plane
  end 

  def park_all(planes = nil)
    planes.dup.each do |plane|
      park(plane)
    end
  end

  def release(plane = nil)
    planes.delete(plane) if plane != nil
    planes.delete(plane.last) if plane == nil
  end 

  def full?
    planes_count == capacity
  end

  def flying_planes
    planes.reject { |plane| plane.landed}
  end

  def landed_planes
    planes.select{ |plane| plane.takes_off}
  end
end