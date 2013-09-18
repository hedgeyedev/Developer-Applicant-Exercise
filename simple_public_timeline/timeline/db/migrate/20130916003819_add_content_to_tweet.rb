class AddContentToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :content, :string
  end
end
