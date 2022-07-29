class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :review

  validates :comment_body, presence: true
end
