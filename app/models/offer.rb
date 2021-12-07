class Offer < ApplicationRecord
  # ---------------------------
  belongs_to :company
  belongs_to :post
  has_many :notifications, dependent: :destroy
  has_many :notification2s, dependent: :destroy
  # --------------------------------------
  validates :offer_comment, presence: true, length: {maximum: 200}
  validates :offer_status, presence: true
  # --------------------------------------
  enum offer_status: {
    negotiation: 0,
    established: 1,
    failure: 2
  }
end
