get '/get20' do
  statuses = []
  TweetStream::Client.new.on_enhance_your_calm do
    puts "WARN: We have an ultimatum from Twitter: Enchance your calm."
  end.sample do |status, client|
    if statuses.size >= 20
      client.stop
    else
      statuses << status
    end
  end
  jsonAry = [] # If I had directly converted statuses, it wouldn't have captured the user data.
  statuses.each do |status|
    hash = status.to_h # So I manually convert the status info to a hash,
    hash[:user] = status.user.to_h # and manually insert the user data.
    jsonAry << hash
  end
  JSON.generate(jsonAry)
  # It's kind of inefficient that TweetStream is getting JSON, serializing it, and then I'm just
  #  turning it back around into JSON again, and I would have just sent the raw JSON, but a way
  #  to do that didn't present itself.
end
