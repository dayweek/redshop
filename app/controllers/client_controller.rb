class ClientController <  ApplicationController
  before_filter :load_categories, :find_cart, :find_top
  
  helper :all
  layout "client"
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation


  def render_not_found(exception)
    log_error(exception)
    render "/error/404.html.erb", :status => 404, :layout => 'client'
    #render :text => 'none'
  end


  def empty_cart
    session[:cart] = nil
    respond_to do |format|
      format.js if request.xhr?
      format.html { redirect_to root_url }
    end
  end

  private 
  def add_to_cart(redirect_path)
    @current_item = @cart.add_product(params[:id])
    respond_to  do |format|
      format.js {  if request.xhr? then
                     render 'products/add_to_cart' 
                   end }
      format.html { 
        flash[:notice]  = 'Zboží bylo přidáno do košíku.'
        redirect_to(redirect_path)
      }
    end
  end
  
  def find_cart
    if current_user
      @cart ||= UserCart.new(current_user.id)
    else  
      session[:cart] ||= Cart.new
      @cart = session[:cart]
    end  
  end

  def find_top
    @top_items = Product.find_top
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

  def load_categories
    @categories = Category.all
  end
end
