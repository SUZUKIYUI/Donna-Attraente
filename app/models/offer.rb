class Offer < ApplicationRecord
  validates :offer_comment, presence: true
  validates :offer_status, presence: true
  # --------------------------------------
  enum offer_status: {
    negotiation: 0,
    established: 1,
    failure: 2
  }
end
