class Admin::KeeperSessionsController < Admin::AdministrationController
  before_filter :require_no_keeper, :only => [:new, :create]
  before_filter :require_keeper, :only => :destroy
  layout 'login'
  
  def new
    @keeper_session = Admin::KeeperSession.new
  end
  
  def create
    @keeper_session = Admin::KeeperSession.new(params[:admin_keeper_session])
    if @keeper_session.save
      flash[:notice] = "Přihlášení úspěšné."
      redirect_back_or_default admin_root_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_keeper_session.destroy
    flash[:notice] = "Odhlášení úspěšné."
    redirect_to new_admin_keeper_session_path
  end
end
