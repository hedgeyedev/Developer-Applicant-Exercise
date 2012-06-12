require 'sinatra'
require 'twitter'
require 'json_builder'

def grabtimeline
  Twitter::Client.configure do |conf|
    # App configuration
    conf.application_name = 'TwitterDemo'
    conf.application_version = '1.0'
    conf.application_url = 'http://www.skermvas.com/'

    #  App OAuth token key/secret pair
    conf.oauth_consumer_token = "4TtTwd12i0e4mbXYCtyaw"
    conf.oauth_consumer_secret = "K3lYEnIoLHAWEMwdb0viXsEbdcIxnKtFcQxEgCWdlI"
  end
  client = Twitter::Client.new(:oauth_access =>
                                   { 	:key 	=> "14706419-ZBgcjjZI9FYLM8WO6OF571S0ItSsNh8Oux8luShX0",
                                       :secret => "YV9fJ5o8LsKZkIKob6ehodsLTdygjXzGVLG1FhXSw"
                                   })

  @public_timeline = client.timeline_for(:public)
  return @public_timeline
end

get '/' do
  grabtimeline
  erb :index
end

get '/via_js' do
  grabtimeline
  erb :viajs
end

get '/via_js.json' do
  grabtimeline
  content_type :json
  # Need to work around dependency of JSONBuilder on Rails relating to variable scope
  @@public_timeline = @public_timeline

  t = JSONBuilder::Compiler.generate do
      rows @@public_timeline do |status|
      profile_image_url "<img src='"+URI.encode(status.user.profile_image_url)+"'</img>"
      screen_name_url "<a href='" + URI.encode("https://twitter.com/" + status.user.screen_name) + "'>" + status.user.screen_name+"</a>"
      text status.text
      created_at status.created_at
      source URI.encode(status.source)
      end
  end
  # Bug in JSON generator that incorrectly generates a escaped single quotes
  q = t.gsub("\\'","'")
  return q
end
