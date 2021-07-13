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

  # -------------------------------なにこれ欲しいの通知を作成-----------------------------------
  def create_notification_want!(current_design_contributor)
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      visited_design_contributor_id: design_contributor_id,
      action: "want"
    )
    if notification.visitor_design_controbutor_id == notification.visited_design_contributor_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  # ---------------------------------------------------------コメントの通知を作成----------------------------------------------------------------
  def create_notification_comment!(current_design_contributor, comment_id)
    temp_ids = Comment.select(:design_contributor_id).where(post_id: id).where.not(design_contributor_id: current_design_contributor.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_design_contributor, comment_id, temp_id["design_contributor_id"])
    end
    save_notification_comment!(current_design_contributor, comment_id, design_contributor_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_design_contributor, comment_id, visited_design_contributor_id)
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_design_contributor_id: visited_design_contributor_id,
      action: "comment"
    )
    if notification.visitor_design_contributor_id == notification.visited_design_contributor_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  # -------------------------------------------企業からのオファーの通知を作成--------------------------------------------------
  def save_notification_offer_company!(current_company, offer_id, visited_design_contributor_id)
    notification = current_company.active_notifications.new(
      post_id: id,
      offer_id: offer_id,
      visited_design_contributor_id: visited_design_contributor_id,
      action: "offer"
    )
    notification.save if notification.valid?
  end






  # --------------------------------------デザイン投稿者からのオファーの通知を作成--------------------------------------------
  def save_notification_offer_design_contributor!(current_design_contributor, offer_id, visited_company_id)
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      offer_id: offer_id,
      visited_company_id: visited_company_id,
      action: "offer"
    )
    notification.save if notification.valid?
  end











end
