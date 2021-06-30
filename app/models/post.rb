class Post < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
  # -------------------------------------
  validates :post_image, presence: true
  validates :author_comment, presence: true
  # ---------------------------------------
  attachment :post_image

end
