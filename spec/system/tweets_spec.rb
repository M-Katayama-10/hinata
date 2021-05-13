require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context '投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'Days', with: @tweet.days
      fill_in 'Dayofweek', with: @tweet.dayofweek
      fill_in 'Member', with: @tweet.member
      fill_in 'program', with: @tweet.program
      fill_in 'Time', with: @tweet.time
      fill_in 'Endtime', with: @tweet.endtime
      fill_in 'supplement', with: @tweet.supplement
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Tweet.count }.by(1)
      # 投稿一覧ページに遷移することを確認する
      expect(current_path).to eq(tweets_path)
      # 投稿一覧ページには先ほど投稿した内容が存在することを確認する
      expect(page).to have_content(@tweet.days)
      expect(page).to have_content(@tweet.dayofweek)
      expect(page).to have_content(@tweet.member)
      expect(page).to have_content(@tweet.program)
      expect(page).to have_content(@tweet.time)
      expect(page).to have_content(@tweet.endtime)
      expect(page).to have_content(@tweet.supplement)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe 'ツイート編集', type: :system do
  before do
    @tweet1 = FactoryBot.create(:tweet)
    @tweet2 = FactoryBot.create(:tweet)
  end
  context 'ツイート編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @tweet1.user.email
      fill_in 'Password', with: @tweet1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ツイート1に「編集」へのリンクがあることを確認する
      expect(
        all('.more')[1].hover
      ).to have_link '編集', href: edit_tweet_path(@tweet1)
      # 編集ページへ遷移する
      visit edit_tweet_path(@tweet1)
      # 投稿内容を編集する
      fill_in 'Days', with: "#{@tweet1.days}+編集した日付"
      fill_in 'Dayofweek', with: "#{@tweet1.dayofweek}+編集した曜日"
      fill_in 'Member', with: "#{@tweet1.member}+編集したメンバー"
      fill_in 'program', with: "#{@tweet1.program}+編集した番組名"
      fill_in 'Time', with: "#{@tweet1.time}+編集した開始時間"
      fill_in 'Endtime', with: "#{@tweet1.endtime}+編集した終了時間"
      fill_in 'supplement', with: "#{@tweet1.supplement}+編集した補足"
      # 編集してもTweetモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Tweet.count }.by(0)
      # 編集完了画面に遷移したことを確認する
      expect(current_path).to eq(tweet_path(@tweet1))
      # 一覧ページに遷移する
      visit tweet_path
      # トップページには先ほど変更した内容が存在することを確認する
      expect(page).to have_content(@tweet.days)
      expect(page).to have_content(@tweet.dayofweek)
      expect(page).to have_content(@tweet.member)
      expect(page).to have_content(@tweet.program)
      expect(page).to have_content(@tweet.time)
      expect(page).to have_content(@tweet.endtime)
      expect(page).to have_content(@tweet.supplement)
    end
  end
  context 'ツイート編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの編集画面には遷移できない' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @tweet1.user.email
      fill_in 'Password', with: @tweet1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ツイート2に「編集」へのリンクがないことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link '編集', href: edit_tweet_path(@tweet2)
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # 一覧ページにいる
      visit tweet_path
      # ツイート1に「編集」へのリンクがないことを確認する
      expect(
        all('.more')[1].hover
      ).to have_no_link '編集', href: edit_tweet_path(@tweet1)
      # ツイート2に「編集」へのリンクがないことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link '編集', href: edit_tweet_path(@tweet2)
    end
  end
end

RSpec.describe 'ツイート削除', type: :system do
  before do
    @tweet1 = FactoryBot.create(:tweet)
    @tweet2 = FactoryBot.create(:tweet)
  end
  context 'ツイート削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @tweet1.user.email
      fill_in 'Password', with: @tweet1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ツイート1に「削除」へのリンクがあることを確認する
      expect(
        all('.more')[1].hover
      ).to have_link '削除', href: tweet_path(@tweet1)
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect{
        all('.more')[1].hover.find_link('削除', href: tweet_path(@tweet1)).click
      }.to change { Tweet.count }.by(-1)
      # 削除完了画面に遷移したことを確認する
      expect(current_path).to eq(tweet_path(@tweet1))
      # 一覧ページに遷移する
      visit tweet_path
      # トップページにはツイート1の内容が存在しないことを確認する
      expect(page).to have_no_content(@tweet.days)
      expect(page).to have_no_content(@tweet.dayofweek)
      expect(page).to have_no_content(@tweet.member)
      expect(page).to have_no_content(@tweet.program)
      expect(page).to have_no_content(@tweet.time)
      expect(page).to have_no_content(@tweet.endtime)
      expect(page).to have_no_content(@tweet.supplement)
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @tweet1.user.email
      fill_in 'Password', with: @tweet1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ツイート2に「削除」へのリンクがないことを確認する
      expect(
        all('.more')[0].hover
      ).to have_no_link '削除', href: tweet_path(@tweet2)
    end
    it 'ログインしていないとツイートの削除ボタンがない' do
      # 一覧ページに移動する
      visit tweet_path
      # ツイート1に「削除」へのリンクがないことを確認する
      expect(
        all('.more')[1].hover
      ).to have_no_link '削除', href: tweet_path(@tweet1)
      # ツイート2に「削除」へのリンクがないことを確認する
      expect(
        all(".more")[0].hover
      ).to have_no_link '削除', href: tweet_path(@tweet2)
    end
  end
end

RSpec.describe 'ツイート詳細', type: :system do
  before do
    @tweet = FactoryBot.create(:tweet)
  end
  it 'ログインしたユーザーはツイート詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @tweet.user.email
    fill_in 'Password', with: @tweet.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # ツイートに「詳細」へのリンクがある
    visit tweet_path
    expect(
      all(".more")[0].hover
    ).to have_link '詳細', href: tweet_path(@tweet)
    # 詳細ページに遷移する
    visit tweet_path(@tweet)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_no_content(@tweet.days)
    expect(page).to have_no_content(@tweet.dayofweek)
    expect(page).to have_no_content(@tweet.member)
    expect(page).to have_no_content(@tweet.program)
    expect(page).to have_no_content(@tweet.time)
    expect(page).to have_no_content(@tweet.endtime)
    expect(page).to have_no_content(@tweet.supplement)
  end
  it 'ログインしていない状態でツイート詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    visit tweet_path
    # ツイートに「詳細」へのリンクがある
    expect(
      all(".more")[0].hover
    ).to have_link '詳細', href: tweet_path(@tweet)
    # 詳細ページに遷移する
    visit tweet_path(@tweet)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_no_content(@tweet.days)
    expect(page).to have_no_content(@tweet.dayofweek)
    expect(page).to have_no_content(@tweet.member)
    expect(page).to have_no_content(@tweet.program)
    expect(page).to have_no_content(@tweet.time)
    expect(page).to have_no_content(@tweet.endtime)
    expect(page).to have_no_content(@tweet.supplement)
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector 'form'
  end
end