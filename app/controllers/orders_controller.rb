class OrdersController < ClientController
  def new
    @order = Order.new
    if not current_user
      flash[:notice] = 'Budeme od Vás potřebovat alespoň základní informace. 
	                Po této registraci budete moci dokončit objednávku.'
      redirect_to :controller => 'user', \
	          :action => 'new', \
		  :checkout => '1' and return
    end
    @items = @cart.cart_items
  end

  def create
    items = UserCartItem.all(:conditions => {:user_id => current_user.id}, \
                             :include => :product)
    order = Order.create(params[:order].merge({:state => 'new'}).merge({:user_id => current_user.id}))
    items.each do |item|
      OrderItem.new(:order_id => order.id, \
                    :price => item.product.price, \
                    :quantity => item.quantity, \
                    :product_id => item.product_id).save!
    end
    UserCartItem.delete_all
    case order.shipment_type
      when 'ceska_posta'
        order.shipment_price = @settings.shipping_ceska_posta_price
    end
    flash[:notice] = 'Zboží bylo objednáno.'
    redirect_to root_url
  end
end
