class Admin::PagesController < Admin::AdministrationController
  uses_tiny_mce
  before_filter :load_pages

  def edit
  end

  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Stránky úspěšně uloženy.'
        format.html { redirect_to edit_admin_page_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  def load_pages 
    @page = Page.first
  end
end
