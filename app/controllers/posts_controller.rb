class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts_all = @user.posts.includes(:comments)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    @posts = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.posts.new(title: post_params[:title], text: post_params[:text], comments_counter: 0, likes_counter: 0)
    return unless @post.save

    redirect_to @user
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
