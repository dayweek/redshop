class CartsController < ClientController
  def show 
    @items = @cart.cart_items
  end
end
