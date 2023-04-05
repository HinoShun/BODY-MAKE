class DailiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_daily, only: [:edit, :destroy, :update]

  def new
    @daily = Daily.new
  end

  def create
    @daily = Daily.new(daily_params)
    if @daily.save
      redirect_to user_path(current_user.id)
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @daily.update(daily_params)
    if @daily.save
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  def destroy
    daily = Daily.find(params[:id])
    daily.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def daily_params
    params.require(:daily).permit(:image, :input_day, :weight, :fat).merge(user_id: current_user.id)
  end

  def set_daily
    @daily = Daily.find(params[:id])
  end
  
end
