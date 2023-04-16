class ReactionsController < ApplicationController
  before_action :set_tweet

  def create	
    like = current_user.reactions.build(tweet_id: params[:tweet_id])	
    like.save	
    # データ保存後、部分表示
    render 'create.js.erb'
  end	
	
  def destroy	
    like = Reaction.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)	
    like.destroy	
    # データ削除後、部分表示
    render 'destroy.js.erb'
  end	

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end
