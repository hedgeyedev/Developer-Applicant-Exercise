module TweetsStream
# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.



	def self.client
		@client ||= TweetStream::Client.new 
	end



	def self.public_tweets
		@statuses = []
		client.sample do |status|
		  # The status object is a special Hash with
		  # method access to its keys.
		  @statuses << status
		  client.stop if @statuses.size >= 20
		end
		@statuses
	
	end

	def self.statuses
		return @statuses
	end


end






