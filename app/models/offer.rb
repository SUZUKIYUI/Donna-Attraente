class Offer < ApplicationRecord
  # ---------------------------
  belongs_to :company
  belongs_to :post
  # --------------------------------------
  validates :offer_comment, presence: true
  validates :offer_status, presence: true
  # --------------------------------------
  enum offer_status: {
    negotiation: 0,
    established: 1,
    failure: 2
  }
end
