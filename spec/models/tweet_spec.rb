require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do
    context '投稿できるとき' do
      it 'days、dayofweek_id、time、endtime、supplementが存在すれば登録できる' do
        expect(@tweet).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'daysが空では登録できない' do
        @tweet.days = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Days can't be blank")
      end
      it 'member_idが空では登録できない' do
        @tweet.member_id = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Member can't be blank")
      end
      it 'member_idが0では登録できない' do
        @tweet.member_id = 0
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Member must be other than 0")
      end
      it 'programが空では登録できない' do
        @tweet.program = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Program can't be blank")
      end
    end
  end
end
