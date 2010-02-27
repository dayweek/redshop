class ProductsController < ClientController
  def add_to_cart_and_redirect
    add_to_cart(product_url(params[:id]))
  end

  def index
    @products = Product.all
    respond_to do |format|
      format.html { render :controller => 'categories', :action => 'show' }
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id], :include => [:photos])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

end
