class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :image,
      :nickname, 
      :email,
      :encrypted_password, 
      :year_of_birth, 
      :sex_id, 
      :purpose_id, 
      :height, 
      :activity_level_id, 
      :publish_target_id, 
      :publish_daily_id, 
      :publish_height_id, 
      :publish_tweet_id 
      ])
    end
end
