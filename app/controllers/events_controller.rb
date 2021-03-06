# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in_user
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
