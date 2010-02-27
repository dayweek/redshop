class UsersController < ClientController
  layout "client"

  # GET /users/new
  # GET /users/new.xml
  def new
    @checkout = true if params[:checkout]
    x, y = rand (10), rand (10)
    @question = "Kolik je #{x} + #{y}?"
    @rightanswer = x + y
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
	@cart = @cart.to_user_cart(@user)
	session[:cart] = nil
	if params[:checkout] then
	  flash[:notice] = 'Byli jste rovnou přihlášeni a nyní můžete dokončit objednávku.'
	  format.html { redirect_to new_order_url }
	else
	  format.html { redirect_to root_url }
	end
	  
      else
	@checkout = true if params[:checkout]
	x, y = rand (10), rand (10)
	@question = "Kolik je #{x} + #{y}?"
	@rightanswer = x + y
	format.html { render :action => "new" }
	format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to root_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
