class Public::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to public_review_path(@review.id)
    else
      @reviews = Reviews.all
      render "index"
    end
  end

  def index

  end

  def show

    #@comments = @review.comments
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to public_review_path(@review.id)
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to public_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end

end
