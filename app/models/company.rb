class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ----------------------------------------------
  has_many :offers, dependent: :destroy
  # オファーの通知（回答受信専用）
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visitedable_id", as: :visitedable, dependent: :destroy
  # オファーの通知（申請送信専用）
  has_many :notification2s, dependent: :destroy
  # ----------------------------------------------
  validates :company_name, presence: true, length: {maximum: 25}
  validates :company_name_kana, presence: true, length: {maximum: 35}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :profile_image, presence: false
  validates :company_introduction, presence: true, length: {maximum: 200}
  # ----------------------------------------------
  attachment :profile_image
  # -----------------------

  # オファーモデルが存在するか
  def offered_by?
    Offer.exists?
  end
  # --------------交渉中のオファーが存在するか-------------------
  def offered_negotiation_by?(company_id)
    offers.where(company_id: company_id, offer_status: :negotiation).exists?
  end
  # -------------------交渉中オファーの数---------------------
  def offered_negotiation_count(company_id)
    offers.where(company_id: company_id, offer_status: :negotiation).count
  end
  # --------------交渉成立オファーが存在するか-------------------
  def offered_established_by?(company_id)
    offers.where(company_id: company_id, offer_status: :established).exists?
  end
  # ------------------交渉成立オファーの数-----------------------
  def offered_established_count(company_id)
    offers.where(company_id: company_id, offer_status: :established).count
  end
  # -------------交渉不成立オファーが存在するか------------------
  def offered_failure_by?(company_id)
    offers.where(company_id: company_id, offer_status: :failure).exists?
  end
  # -----------------交渉不成立オファーの数----------------------
  def offered_failure_count(company_id)
    offers.where(company_id: company_id, offer_status: :failure).count
  end

end
