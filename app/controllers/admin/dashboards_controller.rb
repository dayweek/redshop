class Admin::DashboardsController < Admin::AdministrationController
  def show
    @this_month_title = Time.now.month
    @this_month_quantity = OrderItem.sum(:quantity, :joins => :order, :conditions =>  {:orders  => {:created_at => @this_month_title, :state => 'finished' }})

    @this_month_orders = Order.count(:conditions =>  ["MONTH(created_at) = '#{@this_month_title}'", {:state => 'finished' }])
    @this_month_total =''
  end

end
