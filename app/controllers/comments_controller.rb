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

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    if @comment.destroy
      @comment.update_comments_counter_when_deleted
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
