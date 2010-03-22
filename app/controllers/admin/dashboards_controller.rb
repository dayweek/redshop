class Admin::DashboardsController < Admin::AdministrationController
  def show
    @new_orders_count =  Order.count(:all, :conditions =>  { :state => 'new' })
    time = Time.now
    @months = [month_info(time.month), month_info((time - 1.month).month)]
  end

  private

  def month_info (month)
    info = {}
    info[:title] = month
    info[:items_quantity] = OrderItem.sum(:quantity, :joins => :order, :conditions => ["MONTH(orders.created_at) = '#{month}'", "orders.state = 'finished' "])

    info[:finished_orders_count] = Order.count(:all, :conditions =>  ["MONTH(created_at) = '#{month}'", "state = 'finished' "])
    info[:total] = ''
    info
  end

end
