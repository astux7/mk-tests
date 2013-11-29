module Weather

  BAD_CONDITIONS = ["stormy"]
  GOOD_CONDITIONS = ["sunny"]

  def generator_conditions(condition_collector)
  	condition_collector.shuffle.sample
  end

  def bad_conditions
  	generator_conditions(BAD_CONDITIONS)
  end

  def good_conditions
  	generator_conditions(GOOD_CONDITIONS)
  end

  def all_conditions
  	generator_conditions(merge_conditions)
  end

  def check_weather_good?(weather_now)
    GOOD_CONDITIONS.include?(weather_now.to_s)
  end 
  def check_what_weather
    all_conditions
  end 
  def merge_conditions
    all_conditions_array = []
    all_conditions_array << BAD_CONDITIONS
    all_conditions_array << GOOD_CONDITIONS
    all_conditions_array.flatten
  end
end