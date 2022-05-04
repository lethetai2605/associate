class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin?, only: :index
  def index
    if params[:term]
      @users = User.search(params[:term])
    else
      @users = User.all
    end
    if params[:sort] == "created_at"
      @users = User.sort_by_created_at
    elsif params[:sort] == "name"
      @users = User.sort_by_name
    end
    @user_count =  User.count
    @event_count =  Event.count
    @comment_count = Comment.count
    @post_count = Post.count
    @user_has_no_posts = User.where.missing(:posts).count
    @user_has_no_comments = User.where.missing(:comments).count
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def is_admin?
    flash.alert = 'Account has no permissions'
    redirect_to root_path unless current_user.is_admin?
  end
end
