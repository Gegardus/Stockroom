Rails.application.routes.draw do
  get 'home/index'
  # get 'products/index'
  # get 'products/new'
  # get 'products/show'

  resources :products do
    member do
      post 'add_stock'
      post 'remove_stock'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
