    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not 
    #take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
class Conditions; include Weather; end

describe Weather do
  let(:weather){Conditions.new}
    context 'weather conditions' do
      it 'now should be stormy or sunny' do 
        weather.weather_now.should satisfy{|s| [:stormy, :sunny].include?(s)}
      end
  end
end