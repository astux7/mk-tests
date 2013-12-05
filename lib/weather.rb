module Weather
  def weather_now
    return :sunny if rand(9)  < 7
    return :stormy
  end
end