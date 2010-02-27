# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_locale_from_url, :load_settings
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale 

  def set_locale 
    #locale = extract_locale_from_accept_language_header
    logger.debug ("PARAMS: #{params}")
    #if not params[:locale] then 
    #  if I18n.available_locales.include?(locale.to_sym) then
    #    I18n.locale = locale.to_sym
    #  end
    #  else
    #    if I18n.available_locales.include?(params[:locale].to_sym) then
    #      I18n.locale = params[:locale].to_sym
    #   end
    I18n.locale = :cs
    #end
  end 

  def load_settings 
    @settings = Setting.find(:first)
  end

  private 
  def extract_locale_from_accept_language_header 
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first 
  end 

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
