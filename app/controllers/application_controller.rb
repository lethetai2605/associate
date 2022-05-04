class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash.alert = 'Please log in.'
      redirect_to login_url
    end
  end
end
