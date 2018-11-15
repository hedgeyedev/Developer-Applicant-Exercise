Rails.application.routes.draw do
  resources :users
  resources :tweets
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'welcome#index'
end