class AddLanguageToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :language, :string
  end
end
