class PagesController < ClientController
  before_filter :load_pages

  def about_us
    render :text => @pages.about_us

  end

  def terms_and_conditions
    render :text => @pages.terms_and_conditions

  end

  def load_pages 
    @pages = Page.first
  end

end
