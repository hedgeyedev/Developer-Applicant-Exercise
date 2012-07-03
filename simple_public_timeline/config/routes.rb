SimplePublicTimeline::Application.routes.draw do
 

  namespace :api do
    namespace :v1 do
      resources :examples, 
                :only => [:index, :create, :show, :update, :destroy], 
                :defaults => { :format => 'json' }
    end
  end
  
  
  resources :docs, :only => [:index]
  resources :public_timeline, :only => [:index]

  match "via_js" => "public_timeline#via_js"
  root :to => 'public_timeline#index'


end
