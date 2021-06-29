class Comment < ApplicationRecord

  validates :comment, presence: true

  belongs_to :design_contributor
  belongs_to :post

end
