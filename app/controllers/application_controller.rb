class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      # store_location
      redirect_to login_path
    end
  end

  def verify_user
    load_user
    redirect_to root_path unless @user == current_user
  end

  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
