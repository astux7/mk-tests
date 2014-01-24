require_relative '../local.config' #this only need it require this class via irb
require_relative 'sendsms.rb'
class Takeaway
  include SendSMS
  def initialize(dishes, customers=[])
    @dishes = dishes
    @customers = customers
    @orders = []
  end

  attr_reader :dishes, :customers
  attr_accessor :orders

  # again, this should have been inspect or to_s
  def list_dishes_show
    menu_print = "________________________________\nTakeAway menu: \n\n"
    dishes.each_with_index{|value, key|
      menu_print += "*#{key+1}* #{value.title}   £#{value.price.to_s}\n"
    }
    # but in any case without printing, just returning the string
    print  menu_print += "________________________________\n\n"
  end
  
  def dishes_count
    dishes.count
  end

  def add_customers(customer)
    @customers << customer
  end
   
  def find_customer(customer_id)
    # another implementation
    customer = @customers.detect{|customer| customer.id == customer_id}
    raise "no customer found" unless customer
    customer
  end

  def take_order(order,paid)
    raise "to create order need a customer" if order.customer_id.nil?
    raise "not the same sum - cancel order" if paid != order.total
    make(order)
  end
  
  def make(order)
    send_sms(order.customer_id, order.id) 
    move_to_orders(order)
  end

  def move_to_orders(order)
    @orders << order
    order.status = "cooking"
    # order.instance_methods
  end

  def send_sms(customer_id, order_id) 
    # set up a client to talk to the Twilio REST API
    customer = find_customer(customer_id)
    time_deliver = (Time.new + 60*60).strftime("%Y-%m-%d %H:%M")
    order_id = "ORD"+order_id.to_s+"-"+customer_id.to_s
    twilio_send(customer,time_deliver,order_id)
  end

end