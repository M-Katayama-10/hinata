class Tweet < ApplicationRecord
  with_options presence: true do
    validates :days
    validates :program
  end

  belongs_to :user

  def self.search(search)
    if search != ''
      Tweet.where('program LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true, numericality: { other_than: 0 } do
    validates :member_id
  end

  belongs_to :member
end
