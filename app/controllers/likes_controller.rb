class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)
    return if @like.save

    redirect_to user_post_path(author_id: current_user.id, id: @post.id)
  end
end
