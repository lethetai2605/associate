# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = @user.posts.find(params[:id])
  end

  def update; end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:content, :body)
  end
end
