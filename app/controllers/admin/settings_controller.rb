class Admin::SettingsController < Admin::AdministrationController
  def edit
    @setting = Setting.find(:first)
  end

  def update
    @setting = Setting.find(:first)
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Nastavení úspěšně uloženo.'
        format.html { redirect_to edit_admin_setting_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

end
