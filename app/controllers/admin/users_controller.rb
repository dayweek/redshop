class Admin::UsersController < Admin::AdministrationController
  def index
    conditions = {:active => true}
    if params[:users]
      User.find(params[:users]).each do |pr| 
        pr.active = false
        pr.save!
      end
      flash[:notice] = 'Uživatelé byli úspěšně deaktivováni.'
    end
    @users = User.find(:all, :order => 'created_at DESC', :conditions => conditions)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @user = User.find(params[:id], :include => :orders)
    @user.orders.each do |order|
      case order.state
      when 'new'
        order.state_human = 'Nová'
      when 'finished'
        order.state_human = 'Dokončená'
      else
        order.state_human = 'Neznámý typ'
      end
    end
  end

  def destroy
  end

end
