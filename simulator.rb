# This is essentially an integration test. You could have written it as a part of the test suite
require_relative 'local.config'
require_relative "./lib/takeaway"
require_relative "./lib/dish"
require_relative "./lib/customer"
require_relative "./lib/order"

dish1 = Dish.new("pizza",7.0,"main")
dish2 = Dish.new("lazzania",9.0,"main")
dishes = [dish1,dish2]
takeaway = Takeaway.new(dishes)
customer = Customer.new(1,"Asta","07718172778","my adddresss")
customer.validate_phone(customer.phone)
takeaway.add_customers(customer)
#if exist customer find customer
takeaway.list_dishes_show
order = Order.new(441,customer.id)
order.add_dish_to_order(dish1,2)
order.add_dish_to_order(dish2,1)
order.my_order_show

paid = 23.0
print "\ncustomer gave: £"+paid.to_s+"\n"

takeaway.take_order(order,paid)
order.update_order("cooking",true)

print "\n >>> Order no: ORD#{order.id}-#{customer.id} status :",order.status
print "\n\n\n"