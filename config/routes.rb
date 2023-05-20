Rails.application.routes.draw do
  get "/", to: "pages#main", as: "main"


  scope "/cart" do
    get "/", to: "carts#index", as: "cart"

    post "/add_product", to: "carts#add_product", as: "add_product_to_cart"
    post "/delete_product", to: "carts#delete_product", as: "delete_product_from_cart"
  end

  scope "/order" do
    post "/new", to: "orders#create", as: "new_order"
  end

  scope "/profile" do
    get "/login", to: "profiles#login", as: "login"
    post "/login", to: "profiles#check"
    
    get "/signup", to: "profiles#signup", as: "signup"
    post "/signup", to: "profiles#create"
    get "/logout", to: "profiles#logout", as: "logout"

    get "/:id", to: "profiles#show", as: "profile"
  end

  scope "/products" do
    get "/", to: "products#index", as: "products"
    post "/", to: "products#create"

    get "/new", to: "products#new", as: "new_product"

    get "/:id", to: "products#show", as: "product"
    get "/:id/delete", to: "products#destroy", as: "delete_product"
  end

  namespace :admin do
    scope "/profiles" do
      get "/all", to: "profiles#all", as: "all_profiles"
      get "/:id", to: "profiles#show", as: "profile"
    end
    scope "/orders" do 
      get "/all", to: "orders#all", as: "all_orders"
      get "/:id", to: "orders#show", as: "order"
    end
  end

  namespace :techstaff do
    scope "/orders" do 
      get "/all", to: "orders#all", as: "all_orders"
      get "/:id", to: "orders#show", as: "order"
    end
  end
  
end