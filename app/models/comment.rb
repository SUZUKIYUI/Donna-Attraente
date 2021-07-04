class Comment < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  belongs_to :post
  # --------------------------------
  validates :comment, presence: true

end
