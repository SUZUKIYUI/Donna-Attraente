class Post < ApplicationRecord

  belongs_to :design_contributor

  attachment :post_image

  validates :post_image, presence: true
  validates :author_comment, presence: true


end
