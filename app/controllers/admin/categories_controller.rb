class Admin::CategoriesController <  Admin::AdministrationController
  # GET /categories
  # GET /categories.xml
  def index
    @category = Category.new
    @categories = Category.find(:all, :order => 'position')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end


  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Kategorie úspěšně vytvořena.'
        format.html { redirect_to admin_categories_url }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        @categories = Category.find (:all, :order => 'position')
        format.html { render  :action => "index" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Kategorie úspěšně změněna.'
        format.html { redirect_to(admin_categories_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Kategorie byla úspěšně smazána.'

    respond_to do |format|
      format.html { redirect_to(admin_categories_url) }
      format.xml  { head :ok }
    end
  end

  def sort
    @categories = Category.find(:all)
    @categories.each do | f |
      f.position = params["categories"].index(f.id.to_s)+1
      f.save
    end
    render :nothing => true 
  end
end
