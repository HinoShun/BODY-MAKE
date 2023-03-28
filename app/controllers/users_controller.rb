class UsersController < ApplicationController
  before_action :set_user,            only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    #@tweets = user.tweets
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(user.id)
    else
      render action: :new
    end
  end

  def edit
  end

  private
  
  def user_params
    params.require(:user).permit(:image, :introduction, :status_id, :target_date, :target_weight, :target_fat)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
