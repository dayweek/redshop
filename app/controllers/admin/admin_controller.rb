class Admin::AdminController <  Admin::AdministrationController
  before_filter :require_keeper, :except => :index

  def index

    respond_to do |format|
      unless current_keeper then
        format.html { redirect_to new_admin_keeper_session_path }
      else
        format.html { redirect_to admin_products_path }
      end
    end
  end
end
