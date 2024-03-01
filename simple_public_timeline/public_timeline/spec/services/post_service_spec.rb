require 'rails_helper'

RSpec.describe 'User Service' do
  it 'returns the status data from twitter API' do
    results = UserService.new.statuses(20)

    expect(results).to be_a(Array)
    expect(results.length).to eq(20)

    first_result = results.first
    expect(first_result).to be_a(Hash)
    expect(first_result).to have_key(:created_at)
    expect(first_result).to have_key(:retweeted)

    expect(first_result[:user]).to be_a(Hash)
    expect(first_result[:user]).to have_key(:notifications)
  end
end