class DesignContributor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # -----------------------------------------------
  has_many :posts, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :comments, dependent: :destroy
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
