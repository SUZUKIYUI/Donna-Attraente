class Post < ApplicationRecord
  # ----------------------------
  belongs_to :design_contributor
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :notification2s, dependent: :destroy
  # -------------------------------------
  validates :post_image, presence: true
  validates :author_comment, presence: true, length: {maximum: 90}
  # ---------------------------------------
  attachment :post_image
  # --------------------
  # ページネーションでの表示個数
  POST_COUNT = 12.freeze

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

  # ----------------------------------------------いいね （なにこれ欲しい）の通知メソッド----------------------------------------------------
  def create_notification_want!(current_design_contributor)
    temp = Notification.where(["visitor_id = ? and visitedable_id = ? and visitedable_type = ? and post_id = ? and action = ?",
                              current_design_contributor.id, design_contributor_id, "DesignContributor", id, "like"])
    if temp.blank?
      # デザイン投稿者からの「いいね（なにこれ欲しい）」の通知を作成する
      notification = current_design_contributor.active_notifications.new(
        post_id: id,
        visitedable_id: design_contributor_id,
        visitedable_type: "DesignContributor",
        action: "want"
      )
      #もしデザイン投稿者が自分の投稿に自分でいいねしたら通知しない
      if notification.visitor_id == notification.visitedable_id
        notification.checked = true
      end
      # 全てのデータが正しく入っていれば保存する
      notification.save if notification.valid?
    end
  end

  # -----------------------------------------------------コメントの通知メソッド--------------------------------------------------------------
  def create_notification_comment!(current_design_contributor, comment_id, design_contributor_id)
    # デザイン投稿者からの「コメント」の通知を作成する
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visitedable_id: design_contributor_id,
      visitedable_type: "DesignContributor",
      action: "comment"
    )
    #もしデザイン投稿者が自分の投稿に自分でコメントしたら通知しない
    if notification.visitor_id == notification.visitedable_id
      notification.checked = true
    end
    # 全てのデータが正しく入っていれば保存する
    notification.save if notification.valid?
  end

  # --------------------------------------------------オファー（返信）の通知メソッド---------------------------------------------------------
  def create_notification_offer!(current_design_contributor, offer_id, company_id)
    # デザイン投稿者からの「オファーの返信」の通知を作成する
    notification = current_design_contributor.active_notifications.new(
      post_id: id,
      offer_id: offer_id,
      visitedable_id: company_id,
      visitedable_type: "Company",
      action: "offer"
    )
    # 全てのデータが正しく入っていれば保存する
    notification.save if notification.valid?
  end

  # # ------------------------------------------------オファー（送信）の通知メソッド---------------------------------------------------------
  def create_notification2_offer!(current_company, offer_id, design_contributor_id)
    # 企業からの「オファー」の通知を作成する
    notification = current_company.notification2s.new(
      post_id: id,
      offer_id: offer_id,
      design_contributor_id: design_contributor_id
    )
    # 全てのデータが正しく入っていれば保存する
    notification.save if notification.valid?
  end

end
