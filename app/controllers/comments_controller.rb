class CommentsController < ApplicationController
  def new
    @user = current_user
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(
      text: comment_params[:text],
      author_id: current_user.id,
      post_id: @post.id
    )
    return unless @comment.save

    redirect_to user_posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
