class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_tweet,          only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
