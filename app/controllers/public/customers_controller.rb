class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(16)
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page]).per(6)
  end

  private
  def customer_params
    params.require(:customer).permit(:image, :nick_name)
  end
end
