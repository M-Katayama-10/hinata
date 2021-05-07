class AddEndtimeToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :endtime, :text
  end
end
