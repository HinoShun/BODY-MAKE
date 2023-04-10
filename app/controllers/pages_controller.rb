class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:news]

  def news
  end

end
