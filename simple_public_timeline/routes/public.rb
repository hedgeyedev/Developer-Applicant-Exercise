get '/' do
  @statuses = []
  TweetStream::Client.new.on_enhance_your_calm do
    puts "WARN: We have an ultimatum from Twitter: Enchance your calm."
  end.sample do |status, client|
    if @statuses.size >= 20
      client.stop
    else
      @statuses << status
    end
  end
  erb :direct
end

get '/via_js' do
  erb :via_js
end
