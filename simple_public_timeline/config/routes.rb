Rails.application.routes.draw do
  get 'recent_public_tweets/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'recent_public_tweets#index'
  get '/via_js', to: 'recent_public_tweets#index', as: :javascript
end
