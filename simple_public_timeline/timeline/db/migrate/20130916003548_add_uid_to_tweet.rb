class AddUidToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :uid, :string
  end
end
