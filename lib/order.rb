class Order
  attr_accessor :id, :noticed, :customer_id,:status
  attr_reader :selected_dishes
  def initialize(id, customer_id)
    @id = id
    @customer_id = customer_id
    @selected_dishes = []
    @total = 0
    @status = :in_progress # use symbols for things like @status
    @noticed = false
  end
  
  def add_dish_to_order(dish,quantity)
    @selected_dishes << [dish, quantity]
  end

  # You don't need this, you already have attr_accessor for :status
  
  def total
    @total = 0
    @selected_dishes.each{|item| # inject?
      @total += item.last.to_i * item.first.price
    }
    @total
  end

  def update_order(status,noticed)
    @status = status
    @noticed = noticed
  end

  # a better name would be inspect()
  # The methods inspect() and to_s() are specifically
  # meant to be overridden to provide a better textual
  # representation of the object
  def my_order_show
    list_order = "Your choice:\n"
    @selected_dishes.each do |colection|
      list_order+=" #{colection[1]} x #{colection[0].title}   => £#{colection[1]*colection[0].price}\n"
    end
    list_order+="\n_______\n"
    list_order+="Total: £"+total.to_s
    print list_order # don't print stuff in the code :)
  end
end