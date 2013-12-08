task :authenticate, [:consumer_key, :consumer_secret] => :environment do |_, args|
  # Get the parameter information
  console = Bovem::Console.new
  consumer_key = args[:consumer_key] || console.read("Please enter your Twitter consumer key:", nil, /^\w+$/i)
  consumer_secret = args[:consumer_secret] || console.read("Please enter your Twitter consumer secret:", nil, /^\w+$/i)
  raise ArgumentError.new("Invalid consumer key") if consumer_key.to_s !~ /^\w+$/i
  raise ArgumentError.new("Invalid consumer secret") if consumer_secret.to_s !~ /^\w+$/i


  # Create the request token
  client = OAuth::Consumer.new(consumer_key, consumer_secret, {site: "https://api.twitter.com"})
  authorizer = Clavem::Authorizer.new { |querystring| querystring["oauth_verifier"].first }
  request_token = client.get_request_token(oauth_callback: authorizer.callback_url)
  access_token = nil
  url = request_token.authorize_url(oauth_callback: authorizer.callback_url)
  
  # Delegate authorization to Clavem
  authorizer.authorize(url, false)

  if authorizer.succeeded? then
    access_token = request_token.get_access_token(oauth_verifier: authorizer.token)
  else
    raise RuntimeError.new("Authorization denied on Twitter.")
  end

  # Write results into the file
  File.open(Rails.root + "config/twitter.yml", "w") {|f| f.write({
    consumer_key: consumer_key, consumer_secret: consumer_secret,
    access_token: access_token.token, access_token_secret: access_token.secret
  }.to_yaml) }
end