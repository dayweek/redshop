class CartItem
  attr_reader :product, :quantity
  def initialize(product)
    @product = product
    @quantity = 1
  end
  def increment_quantity
    @quantity += 1
  end
  def decrement_quantity
    @quantity -= 1 if @quantity >= 1
  end
  def price
    @product.price * @quantity
  end
end
