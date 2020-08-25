Rails.application.routes.draw do
  root 'static_pages#home'
  get '/via_js', to: 'static_pages#home_js'
  namespace :api do
    namespace :v1 do
      get '/tweets/:num', to: "tweets_api#tweets"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
