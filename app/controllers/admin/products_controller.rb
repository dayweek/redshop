class Admin::ProductsController < Admin::AdministrationController
  before_filter :find_category
  uses_tiny_mce

  # GET /admin_products
  # GET /admin_products.xml
  def index
    #log.debug params
    conditions = {:active => true}
    if params[:category_id]
      conditions.merge!({:category_id => params[:category_id]})
    end
    if params[:products]
      Product.find(params[:products]).each do |pr| 
        pr.active = false
        pr.save!
      end
      flash[:notice] = 'Zboží bylo úspěšně deaktivováno.'
    end
    @products = Product.all :include => [:category], :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_products }
    end
  end

  # GET /admin_products/1
  # GET /admin_products/1.xml
  def show
    @product = Admin::Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /admin_products/new
  # GET /admin_products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /admin_products/1/edit
  def edit
    @product = Admin::Product.find(params[:id])
  end

  # POST /admin_products
  # POST /admin_products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Zboží bylo úspěšně vytvořeno.'
        format.html { redirect_to admin_product_photos_url(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_products/1
  # PUT /admin_products/1.xml
  def update
    @product = Admin::Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Zboží bylo úspěšně změněno.'
        format.html { redirect_to new_product_photo_url(@product) }
        format.html { redirect_to admin_products_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_products/1
  # DELETE /admin_products/1.xml
  def destroy
    @product = Admin::Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      flash[:notice] = 'Zboží bylo úspěšně smazáno.'
      format.html { redirect_to(admin_products_url) }
      format.xml  { head :ok }
    end
  end

  def deactivate
    @product = Admin::Product.update(params[:id], :active => false)
    respond_to do |format|
      flash[:notice] = 'Zboží bylo úspěšně deaktivováno.'
      format.html { redirect_to(admin_products_url) }
      format.xml  { head :ok }
    end
  end
  def find_category
    #@category = Category.find(params[:category_id])
  end
end
