class UserCart
  attr_reader :items

  def initialize (user_id)
    @user_id = user_id
  end

  def add_product(product)
    current_item = UserCartItem.find(:first, :conditions => {:product_id => product, :user_id => @user_id})
    if current_item then
      current_item.quantity = current_item.quantity + 1
      current_item.save!
    else
      user = User.find(@user_id)
      current_item = user.user_cart_items.create (:quantity => 1, :product_id => product)
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
    UserCartItem.sum('quantity * price', :conditions => { :user_id => @user_id }, :joins => :product)
  end
  
  def total_items
    user = User.find(@user_id)
    user.user_cart_items.sum (:quantity)
  end

  def empty?
    user = User.find(@user_id)
    not user.user_cart_items.exists?
  end  
   
  def cart_items
    items = []
    cart_items = UserCartItem.find(:all, :conditions => { :user_id => @user_id }, :include => :product)
    cart_items.each do |cart_item|
      items << {:id => cart_item.product.id, :title => cart_item.product.title, :total_price => cart_item.product.price * cart_item.quantity, :price => cart_item.product.price, :quantity =>  cart_item.quantity }
    end
    items
  end

end

