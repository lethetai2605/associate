# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin?, only: :index
  def index
    @users = if params[:term]
               User.search(params[:term])
             else
               User.all
             end
    case params[:sort]
    when 'created_at'
      @users = User.sort_by_created_at
    when 'name'
      @users = User.sort_by_name
    end
    @user_count = User.count
    @event_count = Event.count
    @comment_count = Comment.count
    @post_count = Post.count
    @user_has_no_posts = User.where.missing(:posts).count
    @user_has_no_comments = User.where.missing(:comments).count
  end

  def show
    @user = User.find(params[:id])
  end

  def export
    csv = ExportCsvService.new User.all, User::CSV_ATTRIBUTES
    respond_to do |format|
      format.csv do
        send_data csv.perform, filename: 'users.csv'
      end
    end
  end

  private

  def admin?
    flash.alert = 'Account has no permissions'
    redirect_to root_path unless current_user.admin?
  end
end
