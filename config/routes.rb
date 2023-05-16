Rails.application.routes.draw do
  get "/", to: "pages#main", as: "main"
  get "/products", to: "products#index", as: "products"
  post "/products", to: "products#create"
  get "/products/new", to: "products#new", as: "new_product"
  get "/products/:id", to: "products#show", as: "product"
  get "/products/:id/delete", to: "products#destroy", as: "delete_product"
end