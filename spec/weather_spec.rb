    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not 
    #take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
require_relative '../lib/weather'
require_relative '../lib/plane'
class Conditions; include Weather; end

describe Weather do
  let(:now){Conditions.new}
  let(:plane){Plane.new}
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do 
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
  end
end