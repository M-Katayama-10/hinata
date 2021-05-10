class AddDayofweekIdToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :dayofweek_id, :integer
  end
end
