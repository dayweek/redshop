class Admin::OrdersController < Admin::AdministrationController

  def index
    conditions = {}
    if params[:state]
      conditions.merge!({:state => params[:state]})
    end
    @orders = Order.all :include => :user, :conditions => conditions, :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @order = Order.find(params[:id], :include => {:order_items => :product})
    @total = @order.order_items.sum('quantity * price')
    @total = @total.to_f + @order.shipment_price
  end

  def change_state
    if Order.update(params[:id], :state => params[:state]) then
      flash[:notice] = 'Objednávka změněna.'
      respond_to do |format|
        format.html { redirect_to admin_orders_url(:state => 'new') }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_admin_order_url(params[:id]) }
      end
    end
  end
end
