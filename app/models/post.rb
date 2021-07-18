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

  # --------------------------いいね （なにこれ欲しい）の通知メソッド---------------------------
  def create_notification_want!(current_design_contributor)
    temp = Notification.where(["design_contributor_id = ? and visited_user_id = ? and visited_user_type = ? and post_id = ? and action = ?",
                              current_design_contributor.id, design_contributor_id, "DesignContributor", id, "like"])
    design_contributor = DesignContributor.find(design_contributor_id)

    if temp.blank?
      # 自分からの「いいね」の通知を作成する
      notification = current_design_contributor.active_notifications.new(post_id: id, visited_user_id: design_contributor.id, action: "want")
      #もしデザイン投稿者が自分の投稿に自分でいいね したら通知しない
      if (notification.design_contributor_id == notification.visited_user_id) && (notification.visited_user_type == "DesignContributor")
        notification.checked = true
      end
      # 全てのデータが正しく入っていれば保存する
      notification.save if notification.valid?
    end
  end

end
