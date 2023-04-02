class DailiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    @daily = Daily.new
    @dailies = Daily.where(user_id: current_user)
    set_after
    set_before
  end

  def create
    @daily = Daily.new(daily_params)
    if @daily.save
      redirect_to new_daily_path
    else
      render action: :new
    end
  end

  private
  def daily_params
    params.require(:daily).permit(:image, :input_day, :weight, :fat).merge(user_id: current_user.id)
  end

  def set_before
    @dailies.to_a.each do |daily|
      if daily.image.present?
        @after_image = daily
      end
    end
  end

  def set_after
    @dailies.to_a.reverse.each do |daily|
      if daily.image.present?
        @before_image = daily
      end
    end
  end

end
