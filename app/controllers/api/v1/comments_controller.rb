class Api::V1::CommentsController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def index
    post_id = params[:post_id]
    @comments = Post.find(post_id).comments

    if @comments.empty?
      render json: { status: 'ERROR', message: 'No Comments Found' }, status: :not_found
    else
      render json: @comments, status: :ok
    end
  end

  def create
    @comment = Comment.create(
      text: comment_params[:text],
      author_id: params[:author_id],
      post_id: params[:post_id]
    )
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { status: 'ERROR', message: 'Comment Not Created' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:text)
  end
end
