require 'sinatra/base'
class App < Sinatra::Base
  get '/' do
    "html"
  end

  get '/via_js' do
    "js"
  end
end