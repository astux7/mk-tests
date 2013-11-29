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
  	generator_conditions(BAD_CONDITIONS.concat(GOOD_CONDITIONS))
  end

  def check_weather_good?
    BAD_CONDITIONS.each { |condition|
      all_conditions.include?(condition)
      return false
    }
    true
  end 
  def check_what_weather
    all_conditions
  end 
end