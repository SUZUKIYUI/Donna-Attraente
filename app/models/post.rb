class Post < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy
  # -------------------------------------
  validates :post_image, presence: true
  validates :author_comment, presence: true
  # ---------------------------------------
  attachment :post_image
  # --------------------

  # オファーモデルが存在するか
  def offered_by?
    Offer.exists?
  end
  # -------------------交渉中のオファーが存在するか-------------------
  def offered_negotiation_by?(post_id)
    offers.where(post_id: post_id, offer_status: :negotiation).exists?
  end
  # -------------------交渉成立オファーが存在するか-------------------
  def offered_established_by?(post_id)
    offers.where(post_id: post_id, offer_status: :established).exists?
  end
  # ------------------交渉不成立オファーが存在するか------------------
  def offered_failure_by?(post_id)
    offers.where(post_id: post_id, offer_status: :failure).exists?
  end

end
