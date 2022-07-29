class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :game
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :nices, dependent: :destroy

  validates :title, {presence: true, length:{maximum:20}}
  validates :body, presence: true

  # niceされていればtrue, それ以外はfalse
  def nice_by?(customer)
    customer_ids = nices.map {|nice| nice.customer.id }
    customer_ids.include?(customer.id)
  end
end

