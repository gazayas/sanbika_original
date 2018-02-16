class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :songs, dependent: :destroy

  # carrierwaveで画像
  mount_uploader :user_image, UserImageUploader

  # ユーザ名では英数字しか使えないようにする
  USER_NAME_REGEX = /(?!\A\d+\z)\A[a-zA-Z0-9]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, uniqueness: true,
                   length: { minimum: 5, maximum: 40 },
                   format: { with:  USER_NAME_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :user_image

  def email_required?
    false
  end
end
