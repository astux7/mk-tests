# This class wasn't required but well done for including it
class Customer
  def initialize(id,name,phone,address)
    @phone = phone
    @id = id
    @name = name
    @address = address
  end
  attr_accessor :id, :name, :phone, :address
  
  def validate_phone(phone)
    phone_digits = /\d{11}/
    raise "not valid phone!!" unless phone_digits.match(phone)
    # same as in task1: remove all puts() calls before committing the code    
  end
end 