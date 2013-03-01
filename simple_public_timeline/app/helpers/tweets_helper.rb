module TweetsHelper
  def time_from_creation(created_at)
    time_difference =  ((Time.parse(created_at) - Time.now)/60).abs.ceil
    pluralize(time_difference, 'minute')
  end
end