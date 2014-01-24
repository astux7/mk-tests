# Overall, you've got a pretty good test suite (but please don't print anything there)

require_relative "../lib/customer"

describe Customer do 
  let(:customer) {Customer.new(0,"Asta","45345345341","my address")}
  it 'should create the customer' do
    expect(customer.id).to eq(0)
    expect(customer.name).to eq("Asta")
    expect(customer.phone).to eq("45345345341")
    expect(customer.address).to eq("my address")
  end
  it 'should handle the error if not valid phone' do
     expect(lambda { customer.validate_phone("999")}).to raise_error(RuntimeError)
  end
  
end