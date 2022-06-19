class Review < ApplicationRecord
    has_one_attached :image
    belongs_to :game
    belongs_to :customer
    has_many :comments
end

