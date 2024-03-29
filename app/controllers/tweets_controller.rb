class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @tweets = Tweet.order("id DESC")
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
  

  private
  def tweet_params
    params.require(:tweet).permit(:image, :tweet,).merge(user_id: current_user.id)
  end

end
