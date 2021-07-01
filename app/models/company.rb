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
end
