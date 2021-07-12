class Post < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :notifications, dependent: :destroy
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

  # -----------------------いいねの通知を作成-------------------------
  def create_notification_like!(current_design_contributor)
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      visited_design_contributor_id: design_contributor_id,
      action: "like"
    )
    if notification.visitor_design_controbutor_id == notification.visited_design_contributor_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


end
