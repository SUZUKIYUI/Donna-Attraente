class DesignContributor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # -----------------------------------------------
  has_many :posts, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
  # いいね（送受信） ・コメント（送受信）・オファー（送信専用）の通知
  has_many :active_notifications, class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", as: :visited_user, dependent: :destroy
  # オファーの通知（受信専用）
  has_many :notification2s, dependent: :destroy
  # -------------------------------------
  validates :pen_name, presence: true
  validates :profile_image, presence: false
  validates :self_introduction, presence: false
  # -------------------------------------------
  attachment :profile_image
  # -----------------------
  def wanted_by?(post_id)
    wants.where(post_id: post_id).exists?
  end
end
