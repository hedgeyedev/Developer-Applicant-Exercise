Rails.application.routes.draw do
  root to: 'public_timeline#root'

  get '/via_js/', to: 'public_timeline#via_js'

  namespace :api, defaults: { format: :json } do
    get 'twitter_json', to: 'public_timeline#twitter_json'
  end
end
