require 'sinatra/base'
class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/via_js' do
    erb :via_js
  end
end