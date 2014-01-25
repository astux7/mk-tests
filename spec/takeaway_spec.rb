require_relative "../lib/takeaway"

describe Takeaway do 
  let(:dish) {double(:dish,:title=>"pizza",:price=>7.0,:category=>"main")}
  let(:dish1) {double(:dish,:title=>"lazania",:price=>9.0,:category=>"main")}
  let(:customer) {double(:customer,:id=>1,:validate_phone => "looks like phone number ok ",:name=>"ASTA",:phone=>"0777676676",:address=>"my address")}
  let(:order) {double(:order,:id=>1,:customer_id=>1, :total => 50,:status=>"inprogress")}
  let(:takeaway) {Takeaway.new([dish,dish1],[])}
  let(:order2) {double(:order,:id=>1,:customer_id=>1,:add_dish_to_order=>[dish,2],:selected_dishes =>[dish,2], :update_order=>"cooking",:total => 14.0,:status=>"inprogress")}
  let(:order1) {double(:order1,:id=>41,:selected_dishes =>[dish,2],:customer_id=>nil, :total => 70, :status=>"inprogress")}
  it 'should have init with  dishes list == menu' do
    expect(takeaway.dishes.count).to eq(2)
  end
  it 'shoult be 2 dishes in menu' do
    expect(takeaway.dishes_count).to eq(2)
  end

  it 'should add to the system new customer ' do
          takeaway.add_customers(customer)
          expect(takeaway.customers.count).to eq(1) 
  end

  it 'should add customer to customer list' do
          takeaway.add_customers(customer)
          expect(takeaway.customers.count).to eq(1) 
  end

  it 'should raise error if no customer found' do
    expect(lambda { takeaway.find_customer(customer) }).to raise_error(RuntimeError)
  end
  
  it 'should return error if  order total not same as paid sum' do
          expect(lambda { takeaway.take_order(order,20) }).to raise_error(RuntimeError)
  end

  it 'should return error if  order customer id not set' do
          expect(lambda { takeaway.take_order(order1,20) }).to raise_error(RuntimeError)
  end

  it 'should add and find the customer in takeaway customer list' do
          takeaway.add_customers(customer)
          expect(takeaway.customers.count).to eq(1)
          looking = takeaway.find_customer(customer.id)
    expect(looking.id).to eq(customer.id)
  end

  it 'should add order to orders list' do
          takeaway.move_to_orders(order) 
     expect(takeaway.orders.count).to eq(1)
  end

  it 'should proceed grand demo of TAKEAWAY system' do
    dishes = [dish1,dish]
    takeaway = Takeaway.new(dishes)
    customer.validate_phone(customer.phone)
    takeaway.add_customers(customer)
    #if exist customer find customer
    takeaway.list_dishes_show
    expect(order2.selected_dishes).to eq([dish,2])
    paid = 14.0

    takeaway.take_order(order2,paid)
    order2.update_order("cooking",true)
    expect(takeaway.orders.count).to eq(1)
  end


end