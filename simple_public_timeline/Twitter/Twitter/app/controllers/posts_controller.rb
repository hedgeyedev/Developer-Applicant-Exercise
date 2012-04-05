class PostsController < ApplicationController

def index
   @tweets=[]
   #while @tweets.count < 20
   TweetStream::Client.new.sample() do |tweet|
	 @tweets << tweet
     puts @tweets.count
       if @tweets.count >19 
        	break
       end
	#puts "#{tweet.count}"
    end
end



end
