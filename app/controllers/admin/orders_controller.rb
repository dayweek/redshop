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

    case @order.shipment_type 
      when 'ceska_posta'
        @shipment_text = "Česká pošta (#{@settings.shipping_ceska_posta_price},-)"
      when 'vyzvednuti'
        @shipment_text = "Osobní vyzvednutí."
      else
        @shipment_text = "Chyba aplikace! Neznámý způsob dodání."
    end

    @total = @total.to_f + @order.shipment_price
    case @order.payment_type 
      when 'bank_transfer'
        @payment_text = "Převodem na účet. Variabilní symbol: #{@order.created_at.year.to_s + @order.id.to_s}"
      when 'cash'
        @payment_text = "Hotově"
      else
        @payment_text = "Chyba aplikace! Neznámý způsob platby."
    end
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
