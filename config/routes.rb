Rails.application.routes.draw do
  
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  resources :recipes, only: [:index, :show, :new, :edit, :create, :destroy]
  resources :users
  resources :recipe_foods
  resources :foods, only: [:index, :show, :new, :edit,:create, :destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  
  get "/public_recipes(.:format)", to: "public_recipes#index", as: 'public_recipes'
  get "/public_recipes/:id(.:format)", to: "public_recipes#show", as: 'public_recipe'
end
