class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_body, :review_id)
  end
end
