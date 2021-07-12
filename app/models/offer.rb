class Offer < ApplicationRecord
  # ---------------------------
  belongs_to :company
  belongs_to :post
  has_many :notifications, dependent: :destroy
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
