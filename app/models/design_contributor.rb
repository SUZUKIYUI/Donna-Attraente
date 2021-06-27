class DesignContributor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :pen_name, presence: true
  validates :profile_image, presence: false
  validates :self_introduction, presence: false

  has_many :posts, dependent: :destroy

  attachment :profile_image

end
