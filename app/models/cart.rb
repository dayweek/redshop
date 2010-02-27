class Cart
  attr_reader :items
  def initialize
    @items = []
  end

  def cart_items
  items = []
  @items.each do |item|
    p = Product.find(item.product)
    items << {:id => p.id, :title => p.title, :price => p.price * item.quantity, :quantity =>  item.quantity }
  end
  items
  end

  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
    end
    current_item
  end

  def remove_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item then
      current_item.decrement_quantity
      if current_item.quantity == 0 then
        @items.delete current_item
        nil
      else
        current_item
      end
    end
  end

  def total_price
    @items.sum { |item| Product.find(item.product).price * item.quantity}
  end

  def total_items
      @items.sum { |item| item.quantity }
  end

  def empty?
    @items.empty?
  end  

  def to_user_cart(user)
    @items.each do |item| 
      UserCartItem.new(:quantity => item.quantity, :user_id => user.id, :product_id => item.product).save!
    end
    UserCart.new(user.id)
  end
end



