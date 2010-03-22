class PagesController < ClientController
  layout 'client'

  def about_us
    render :text => @pages.about_us, :layout => true

  end

  def terms_and_conditions
    render :text => @pages.terms_and_condition, :layout => true

  end

  def faq
    render :text => @pages.faq, :layout => true 

  end

end
