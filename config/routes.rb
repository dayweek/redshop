ActionController::Routing::Routes.draw do |map|



  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end
  #ActionController::Routing::Translator.translate_from_file('config','i18n-routes.yml')
  #ActionController::Routing::Translator.i18n('cs')

  #map.resources :categories, :path_prefix => '/:locale' do |products|
  #   products.resources :products
  #end
  #map.resources :products, :path_prefix => '/:locale'
  #
  # Bez kategorie
  #map.root  :controller => "categories"
  #map.connect '', :controller => "categories"
  #map.category ":category_id", :controller => "categories", :action => :show
  #map.product ":category_id/:id",  :controller => "products", :action => :show
  #
  map.namespace(:admin) do |admin|
    admin.root :controller => "dashboards", :action => "show"
    #admin.logout 'logout', :controller => "keeper_sessions", :action => "destroy"
    #admin.logout 'logout', :controller  => "keeper_sessions", :action =>  :destroy
    admin.resource :setting, :page, :keeper_session, :dashboard
    admin.resources :users
    admin.resources :orders, :member => { :change_state => :put }
    admin.resources   :products, :member => { :deactivate => :put } do |product| 
    product.resources :photos
    end
    admin.resources :categories ,  :shallow => true, :collection => { :sort => :post} do |category|
      category.resources   :products, :shallow => true do |product|
        product.resources :photos,  :shallow => true
      end
    end
  end
  map.resources :products
  map.resources :categories, :has_many => :products , :shallow => true 
  map.resource :user do |user|
    user.resources :orders
  end
  map.resource :cart
  map.resources :orders
  map.resource :user_session
  map.root :controller => "categories", :action => "show"
  map.connect '', :controller => "categories", :action => "show"
  map.connect 'o-nas', :controller => "pages", :action => "o_nas"
  map.connect 'obchodni-podminky', :controller => "pages", :action => "terms_and_conditions"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/'

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
