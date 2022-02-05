Rails.application.routes.draw do
  root "home#index"
  
  resources :recipes do 
    resources :recipe_steps
    resources :recipe_ingredients
  end
  resources :locations
  get 'users/index'
  resources :ingredients
  resources :states
  resources :units
  #devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  #get 'home/index'
  #get 'create_update/index'
  get "home/about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
