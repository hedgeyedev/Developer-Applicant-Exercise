Rails.application.routes.draw do
  root 'tweets#index'
  get '/via_js', to: 'tweets#via_js'
end
