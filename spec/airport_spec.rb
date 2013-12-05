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
  #let(:weather){double(:weather,:"weather_now"=>[:sunny,:stormy])}
  
  context 'taking off and landing' do
    it 'a plane can land' do
      airport.park(plane)
      expect(airport.planes_count).to eq(1)
      expect(plane.status).to eq("landed")
    end
    
    it 'a plane can take off' do
      airport.release(plane)
      expect(airport.planes_count).to eq(0)
      expect(plane.status).to eq("flying")
    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      3.times {airport.park(Plane.new)}
      expect(lambda { airport.park(plane) }).to raise_error(RuntimeError)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off
    # and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        airport.park(plane)
        airport.permission_take_off(plane)
        airport.planes_count.should satisfy{|s| [0, 1].include?(s)}
      end
      
      it 'a plane cannot land in the middle of a storm' do
        airport.park(plane)
        expect(airport.planes_count).to eq(1)
        airport.permission_take_off(plane)
        airport.planes_count.should satisfy{|s| [0, 1].include?(s)}
        aiport2 = Airport.new(2)
        aiport2.park(Plane.new)
        aiport2.permission_land(plane)
        airport.planes_count.should satisfy{|s| [0, 1, 2].include?(s)}
      end
    end


    # grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
  describe "The gand finale (last spec)" do
    it 'all planes can land and all planes can take off' do
      pl1,pl2,pl3,pl4,pl5,pl6 = Plane.new,Plane.new,Plane.new,Plane.new,Plane.new,Plane.new
      planes = [pl1,pl2,pl3,pl4,pl5,pl6]
      airport3 = Airport.new(6)
      airport3.permission_land_all(planes)
      planes.each{ |plane| 
        plane.status.should satisfy{|s| ["landed", "flying"].include?(s)}
      }
      airport3.planes_count.should satisfy{|s| [0, 1, 2, 3,4,5,6].include?(s)}
      airport3.permission_take_off_all
      planes.each{ |plane| 
       expect(plane.status).to eq("flying") if plane.take_off
      }
    #  expect(airport3.planes_count).to eq(0)
    end
  end
end

end
 