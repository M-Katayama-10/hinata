class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order(days: "ASC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
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
    redirect_to root_path
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def ushio
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "2"))
  end

  def kageyama
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "3"))
  end

  def katou
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "4"))
  end

  def saitou
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "5"))
  end

  def kumi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "6"))
  end

  def mirei
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "7"))
  end

  def takase
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "8"))
  end

  def takamoto
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "9"))
  end

  def higashimura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "10"))
  end

  def kanemura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "11"))
  end

  def kawata
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "12"))
  end

  def kosaka
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "13"))
  end

  def tomita
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "14"))
  end

  def nibu
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "15"))
  end

  def hamagishi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "16"))
  end

  def matsuda
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "17"))
  end

  def miyata
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "18"))
  end

  def watanabe
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "19"))
  end

  def kamimura
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "20"))
  end

  def takahashi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "21"))
  end

  def morimoto
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "22"))
  end

  def yamaguchi
    @tweets = Tweet.where(member_id: "1").or(Tweet.where(member_id: "23"))
  end


  private
  
  def tweet_params
    params.require(:tweet).permit(:days, :member_id, :program, :time, :supplement, :endtime, :dayofweek_id).merge(user_id: current_user.id)
  end

end

