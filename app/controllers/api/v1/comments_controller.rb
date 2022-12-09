class Api::V1::CommentsController < Api::V1::ApiController
  def index
    post_id = params[:post_id]
    @comments = Post.find(post_id).comments
    render json: @comments, status: :ok
  end

  def show; end

  def create
    author_id = @current_user.id,
                text = params[:text],
                post_id = params[:post_id]
    if author_id && text && post_id
      comment = Comment.new(author_id, text, post_id)
      if comment.save
        render json: { status: 'SUCCESS', message: 'Comment Has Been Created', data: comment }, status: :ok
      else
        render json: { status: 'ERROR', message: 'Comment Has NOT Been Created', data: comment.errors },
               status: :unprocessable_entity
      end
    else
      render json: { status: 'ERROR', message: 'Invalid Prameters' }, status: :not_found
    end
  end
end
