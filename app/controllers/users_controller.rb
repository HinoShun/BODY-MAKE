class UsersController < ApplicationController
  before_action :set_user,            only: [:show, :edit, :update]

  def show
    @dailies = Daily.where(user_id: params[:id]).order(input_day: "DESC")
    set_after
    set_before
    @basal_metabolism = calculation_basal_metabolism
    @diff_calorie =  diff_calorie
    @calorie_intake = calculation_calorie_intake
    @nutrients = calculation_nutrients
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :image, 
      :nickname, 
      :introduction, 
      :year_of_birth, 
      :sex_id, 
      :purpose_id, 
      :target_date, 
      :target_weight, 
      :target_fat, 
      :activity_level_id, 
      :publish_target_id, 
      :publish_daily_id, 
      :publish_height_id, 
      :publish_tweet_id
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_before
    @dailies.to_a.reverse.each do |daily|
      if daily.image.present?
        @after_image = daily
      end
    end
  end

  def set_after
    @dailies.to_a.each do |daily|
      if daily.image.present?
        @before_image = daily
      end
    end
  end

  def calculation_basal_metabolism
    
  end

  def diff_calorie
  end

  def calculation_calorie_intake
  end

  def calculation_nutrients
  end

end
