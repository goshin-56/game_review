class Review < ApplicationRecord
    has_one_attached :image
    belongs_to :game
    belongs_to :customer
end

