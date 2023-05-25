Rails.application.routes.draw do
  get "/", to: "pages#main", as: "main"
  get "/admin_links", to: "pages#admin_links", as: "admin_links"
  get "/techstaff_links", to: "pages#techstaff_links", as: "techstaff_links"

  scope "/cart" do
    get "/", to: "carts#index", as: "cart"

    post "/add_product", to: "carts#add_product", as: "add_product_to_cart"
    post "/delete_product", to: "carts#delete_product", as: "delete_product_from_cart"
  end

  scope "/order" do
    post "/new", to: "orders#create", as: "new_order"
  end

  scope "/profile" do
    get "/", to: "profiles#show", as: "profile"
    
    get "/login", to: "profiles#login", as: "login"
    post "/login", to: "profiles#check"
    
    get "/signup", to: "profiles#signup", as: "signup"
    post "/signup", to: "profiles#create"
    get "/logout", to: "profiles#logout", as: "logout"

    get "/order/:id/pay", to: "profiles#pay", as: "pay_order"
    post "/order/:id/pay", to: "profiles#pay_order"

    get "/order/:id", to: "profiles#order", as: "profile_order"
  end

  scope "/products" do
    get "/", to: "products#all", as: "products"

    get "/:id", to: "products#show", as: "product"
    get "/:id/delete", to: "products#destroy", as: "delete_product"
  end

  namespace :admin do
    scope "/profiles" do
      get "/all", to: "profiles#all", as: "all_profiles"

      get "/:id", to: "profiles#show", as: "profile"
      get "/:id/block", to: "profiles#block", as: "profile_block"
    end

    scope "/orders" do 
      get "/all", to: "orders#all", as: "all_orders"

      get "/:id", to: "orders#show", as: "order"
      get "/:id/cancelled", to: "orders#cancelled", as: "order_cancelled"
    end

    scope "/products" do
      get "/all", to: "products#all", as: "all_products"

      get "/new", to: "products#new", as: "new_product"
      post "/new", to: "products#create"

      get "/:id/edit", to: "products#edit", as: "edit_product"
      post "/:id/edit", to: "products#change"
      post "/:id/delete", to: "products#destroy", as: "delete_product"
    end
  end

  namespace :techstaff do
    scope "/orders" do 
      get "/all", to: "orders#all", as: "all_orders"

      get "/:id", to: "orders#show", as: "order"
      get "/:id/edit", to: "orders#edit", as: "edit_order"
      post "/:id/edit", to: "orders#change"
    end
  end
end