Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :tweets, action: :index

  get 'via_js', to: 'tweets#via_js'
end
