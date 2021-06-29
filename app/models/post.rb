class Post < ApplicationRecord

  belongs_to :design_contributor
  has_many :comments, dependent: :destroy

  attachment :post_image

  validates :post_image, presence: true
  validates :author_comment, presence: true


end
