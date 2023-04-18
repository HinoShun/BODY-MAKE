class UsersController < ApplicationController
  before_action :set_user,            only: [:show, :edit, :update]

  def show
    @dailies = Daily.where(user_id: params[:id]).order(input_day: "DESC")
    @latest_data = Daily.where(user_id: params[:id]).order(input_day: "DESC").limit(1)
    if @dailies.present? #dailiesテーブルにデータが登録されていれば実行
      set_after #一番新しい画像データの取得
      set_before #一番古い画像データの取得
      set_now_weight_fat #現在の体重データを取得
      @age = calculation_age #誕生年より年齢を算出
      @basal_metabolism = calculation_basal_metabolism #基礎代謝を算出
      @coeff = colculation_coeff #活動レベル・年齢・性別による消費カロリー係数を算出
      @diff_calorie =  diff_calorie #1日消費カロリーの算出
      @calorie_intake = calculation_calorie_intake #1日の目標摂取カロリーを算出
      @nutrients = calculation_nutrients #栄養素の算出
    end
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
      :target_date, 
      :target_weight, 
      :target_fat,
      :year_of_birth,
      :height,
      :sex_id, 
      :purpose_id,
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

  def set_now_weight_fat
    if @latest_data.present?
      @now_date = @latest_data[0][:input_day]
      @now_weight = @latest_data[0][:weight]
      @now_fat = @latest_data[0][:fat]
    end
  end


  def set_before
    if @dailies.present?
      @dailies.to_a.reverse.each do |daily|
        if daily.image.present?
          @after_image = daily
        end
      end
    end
  end

  def set_after
    if @dailies.present?
      @dailies.to_a.each do |daily|
        if daily.image.present?
          @before_image = daily
        end
      end
    end
  end

  def calculation_age
    year = Date.today.year.to_i
    @age = year - @user.year_of_birth
  end

  def calculation_basal_metabolism
    if @latest_data.present?
      @weight = @latest_data[0][:weight]
      if @user.sex_id == 2
        @basal_metabolism = (13.397 * @weight) + (4.799 * @user.height) - (5.677 * @age) + 88.362
      elsif @user.sex_id == 3
        @basal_metabolism = (9.247 * @weight) + (3.098 * @user.height) - (4.33 * @age) + 447.593
      end
    end
  end

  def colculation_coeff
    if @user.activity_level_id == 4
      @coeff = 1.4 if @age >= 75
      @coeff = 1.45 if @age >= 65
      @coeff = 1.5 if @age >= 18
      @coeff = 1.55 if @age >= 15
      @coeff = 1.4 if @age >= 1 
    elsif @user.activity_level_id == 3
      @coeff = 1.65 if @age >= 75
      @coeff = 1.7 if @age >= 65
      @coeff = 1.75 if @age >= 15
      @coeff = 1.65 if @age >= 1 
    elsif @user.activity_level_id == 2
      @coeff = 1.95 if @age >= 65
      @coeff = 2 if @age >= 18
      @coeff = 1.95 if @age >= 15
      @coeff = 1.85 if @age >= 1 
    end
  end

  def diff_calorie
    if @latest_data.present?
      @calories_burned = @basal_metabolism * @coeff
      if @user.target_date?
        @days = (@user.target_date - Date.current).to_i
      end
      if @user.target_weight?
        @diff_weight = (@weight - @user.target_weight)
        @diff_calorie =  @diff_weight * 7200 / @days
      end
    end
  end

  def calculation_calorie_intake #目標摂取カロリー
    if @latest_data.present? && @diff_calorie.present?
      @calorie_intake = @calories_burned - @diff_calorie
    end
  end

  def calculation_nutrients #PFC
    if @latest_data.present? && @calorie_intake.present?

      if @user.purpose_id == 3 #減量
        @protein_c = @calorie_intake * 0.3
        @carbo_c = @calorie_intake * 0.6
        @lipid_c = @calorie_intake * 0.1
      else
        @protein_c = @calorie_intake * 0.3
        @carbo_c = @calorie_intake * 0.5
        @lipid_c = @calorie_intake * 0.2
      end

      @protein_g = @protein_c / 4
      @carbo_g = @carbo_c / 4
      @lipid_g = @lipid_c / 9

    end

  end
end
