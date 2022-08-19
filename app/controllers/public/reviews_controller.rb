class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @review = current_customer.reviews.new(review_params)
    @review.game_id = params[:game_id]
    if @review.save
      redirect_to public_game_path(@game)
    else
      render "new"
    end
  end

  def show
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    @comments = @review.comments.page(params[:page]).per(10)
    @comment = current_customer.comments.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to public_game_path(@game.id)
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to public_game_path(@game.id)
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game_id)
  end
end
