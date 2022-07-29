class Public::NicesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @nice = current_customer.nices.build(review_id: params[:review_id])
    @nice.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    nice = current_customer.nices.find_by(review_id: params[:review_id])
    nice.destroy
  end
end
