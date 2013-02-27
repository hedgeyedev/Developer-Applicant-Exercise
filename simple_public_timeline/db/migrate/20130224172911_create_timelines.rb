class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|

      t.timestamps
    end
  end
end
