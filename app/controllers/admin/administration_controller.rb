# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Admin::AdministrationController < ApplicationController
  helper :all # include all helpers, all the time
  layout "admin"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  helper_method :current_keeper_session, :current_keeper
  filter_parameter_logging :password, :password_confirmation
  before_filter :require_keeper
  
  private
  def current_keeper_session
    return @current_keeper_session if defined?(@current_keeper_session)
    @current_keeper_session = Admin::KeeperSession.find
  end
  
  def current_keeper
    return @current_keeper if defined?(@current_keeper)
    @current_keeper = current_keeper_session && current_keeper_session.record
  end
  
  def require_keeper
    unless current_keeper
      store_location
      flash[:notice] = "Musíte se přihlásit k prohlížení této stránky."
      redirect_to new_admin_keeper_session_url
      return false
    end
  end

  def require_no_keeper
    if current_keeper
      store_location
      flash[:notice] = "Musíte být odhlášeni pro prohlížení této stránky."
      redirect_to admin_categories_url
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
end
