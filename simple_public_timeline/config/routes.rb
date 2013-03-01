SimplePublicTimeline::Application.routes.draw do
 

  namespace :api do
    namespace :v1 do
      resources :examples, 
                :only => [:index, :create, :show, :update, :destroy], 
                :defaults => { :format => 'json' }
    end
  end
  
  
  resources :docs, :only => [:index]
  resources :tweets, :only => [:index]
  get 'tweets/via_js'

  root :to => 'tweets#index'

end
