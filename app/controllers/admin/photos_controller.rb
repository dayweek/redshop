class Admin::PhotosController < Admin::AdministrationController
  before_filter :find_product, :except => [:update]
  # GET /photos
  # GET /photos.xml
  def index
    @photos = @product.photos.all
    @photo = Photo.new(:product_id => @product.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new(:product_id => @product.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])
    @photos = @product.photos.all

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Fotografie byla úspěšně vytvořena.'
        format.html { redirect_to admin_product_photos_path(@product) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render  :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Fotografie byla úspěšně změněna.'
        format.html { redirect_to admin_product_photos_path(@photo.product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      flash[:notice] = 'Fotografie byla úspěšně smazána.'
      format.html { redirect_to(admin_product_photos_url(@product)) }
      format.xml  { head :ok }
    end
  end
  def find_product 
  @product = Product.find(params[:product_id])
  end
end
