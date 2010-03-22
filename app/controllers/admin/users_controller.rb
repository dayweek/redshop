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
  end

  def destroy
  end

end
