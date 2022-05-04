# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    return if logged_in?

    flash.alert = 'Please log in.'
    redirect_to login_url
  end
end
