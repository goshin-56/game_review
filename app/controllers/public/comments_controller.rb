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
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to public_game_review_path(@game.id,@review.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_body, :review_id, :game_id)
  end
end
