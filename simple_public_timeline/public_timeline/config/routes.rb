Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#timeline'
  get '/via_js', to: 'tweets#via_js'

  get '/login', to: 'users#login'
  get '/register', to: 'users#register', as: 'register_user'
end
