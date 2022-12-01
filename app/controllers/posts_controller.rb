class PostsController < ApplicationController
  def index
    @posts_all = Post.where(author_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    # @posts_all = @user.posts
  end

  def show
    @posts = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
  end
end
