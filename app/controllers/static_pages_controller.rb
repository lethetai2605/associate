class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
  end
end
