class Comment < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  belongs_to :post
  has_many :notifications, dependent: :destroy
  # --------------------------------
  validates :comment, presence: true

end
