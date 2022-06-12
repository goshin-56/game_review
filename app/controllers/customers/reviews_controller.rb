class Customers::ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to customers_review_path(@review.id)
    else
      @reviews = Reviews.all
      render "index"
    end
  end

  def index
    @review = Review.new
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end

end
