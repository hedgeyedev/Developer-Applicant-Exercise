RSpec.configure do |config|
  config.before do
    Redis.new.flushall
  end
end
