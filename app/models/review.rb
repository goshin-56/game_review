class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :game
  belongs_to :customer
  has_many :comments
  has_many :nices

  validates :title, {length:{maximum:20}}

  # niceされていればtrue, それ以外はfalse
  def nice_by?(customer)
    customer_ids = nices.map {|nice| nice.customer.id }
    customer_ids.include?(customer.id)
  end
end

