class CommentsController < ApplicationController
  def created
    @typeio = Typeio.find(params[:typeio_id])

    if @typeio.comments.create(comment_params)
      redirect_to @typeio,
        notice: 'Comment was successfully created'
    else
      redirect_to @typeio,
        alert: 'Error creating comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
