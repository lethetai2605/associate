class PostsController < ApplicationController
  before_action :find_user, only: %i[index show]
  def index
    @posts = @user.posts
  end
  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
