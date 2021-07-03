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

  # 企業がオファー済み
  def

  end

  # 交渉中のオファー
  def offers_negotiation(company_id)

  end

  # 交渉成立オファー
  def offers_established

  end

  # 交渉不成立オファー
  def offers_failure

  end

end
