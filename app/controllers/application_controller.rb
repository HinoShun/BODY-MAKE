class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_NAME"] && password == ENV["BASIC_AUTH_PASS"]
    end
  end

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
