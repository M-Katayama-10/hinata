class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order(days: "DESC").order(time: "DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet.id)
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def ushio
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "2")).order(days: "DESC").order(time: "DESC")
  end

  def kageyama
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "3")).order(days: "DESC").order(time: "DESC")
  end

  def katou
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "4")).order(days: "DESC").order(time: "DESC")
  end

  def saitou
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "5")).order(days: "DESC").order(time: "DESC")
  end

  def kumi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "6")).order(days: "DESC").order(time: "DESC")
  end

  def mirei
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "7")).order(days: "DESC").order(time: "DESC")
  end

  def takase
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "8")).order(days: "DESC").order(time: "DESC")
  end

  def takamoto
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "9")).order(days: "DESC").order(time: "DESC")
  end

  def higashimura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "10")).order(days: "DESC").order(time: "DESC")
  end

  def kanemura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "11")).order(days: "DESC").order(time: "DESC")
  end

  def kawata
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "12")).order(days: "DESC").order(time: "DESC")
  end

  def kosaka
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "13")).order(days: "DESC").order(time: "DESC")
  end

  def tomita
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "14")).order(days: "DESC").order(time: "DESC")
  end

  def nibu
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "15")).order(days: "DESC").order(time: "DESC")
  end

  def hamagishi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "16")).order(days: "DESC").order(time: "DESC")
  end

  def matsuda
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "17")).order(days: "DESC").order(time: "DESC")
  end

  def miyata
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "18")).order(days: "DESC").order(time: "DESC")
  end

  def watanabe
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "19")).order(days: "DESC").order(time: "DESC")
  end

  def kamimura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "20")).order(days: "DESC").order(time: "DESC")
  end

  def takahashi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "21")).order(days: "DESC").order(time: "DESC")
  end

  def morimoto
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "22")).order(days: "DESC").order(time: "DESC")
  end

  def yamaguchi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "23")).order(days: "DESC").order(time: "DESC")
  end


  private
  
  def tweet_params
    params.require(:tweet).permit(:days, :member_id, :program, :time, :supplement, :endtime, :dayofweek_id).merge(user_id: current_user.id)
  end

end

