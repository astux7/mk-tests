require_relative '../lib/airport'
require_relative '../lib/plane'
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new(3) }
  let(:plane) {Plane.new}
  
  context 'taking off and landing' do
    it 'a plane can land' do
      plane.landed
      airport.park(plane)
      expect(airport.planes_count).to eq(1)
    end
    
    it 'a plane can take off' do
      plane.takes_off
      airport.release(plane)
      expect(airport.planes_count).to eq(0)
    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      3.times {airport.park(Plane.new)}
      expect(lambda { airport.park(plane) }).to raise_error(RuntimeError)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end
 