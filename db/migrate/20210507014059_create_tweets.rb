class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
     t.date       :days,        null: false
     t.integer    :member_id,   null: false
     t.text       :program,     null: false
     t.text       :time
     t.text       :supplement
     t.references :user,        null: false, foreign_key: true 
     t.timestamps
    end
  end
end

