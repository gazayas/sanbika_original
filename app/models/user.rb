class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :songs, dependent: :destroy

  # carrierwaveで画像
  mount_uploader :user_image, UserImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, uniqueness: true, length: { minimum: 5, maximum: 40 }, format: { with: /(\A[a-zA-Z]+)([a-zA-Z]|[0-9]|[_].)/ }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :password # initializers/devise.rbでは長さのバリデーションを変えることができます
  # validates :user_image

  def email_required?
    false
  end
end
