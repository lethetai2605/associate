class PostsController < ApplicationController
  def show
    @post = Post.first
  end
end
