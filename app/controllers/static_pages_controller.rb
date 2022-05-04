# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
  end
end
