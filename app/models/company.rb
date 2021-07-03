class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ----------------------------------------------
  validates :company_name, presence: true
  validates :company_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :profile_image, presence: false
  validates :company_introduction, presence: false
  # ----------------------------------------------
  attachment :profile_image
  # -----------------------

  # オファーモデルあり
  def offered_by?
    Offer.exists?
  end

  # 交渉中のオファー
  def offered_negotiation_by?(company_id)
    offers.where(company_id: company_id, offer_status: 0).exists?
  end

  # 交渉成立オファー
  def offered_established_by?(company_id)
    offers.where(company_id: company_id, offer_status: 1).exists?
  end

  # 交渉不成立オファー
  def offered_failure_by?(company_id)
    offers.where(company_id: company_id, offer_status: 2).exists?
  end

end
