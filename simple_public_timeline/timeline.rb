require 'sinatra'

get '/' do
  erb :index, layout: :main
end
