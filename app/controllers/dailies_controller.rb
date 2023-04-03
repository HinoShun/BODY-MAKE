class DailiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    @daily = Daily.new
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


end
