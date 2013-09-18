class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :screen_name
      t.datetime :published_at
      t.string :profile_image_url
      t.string :source

      t.timestamps
    end
  end
end
