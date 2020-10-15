class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter, :facebook]

  has_many :songs, dependent: :destroy

  # carrierwaveで画像
  # mount_uploader :user_image, UserImageUploader

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # def email_required?
  #   false
  # end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      # The sub logic for the images helps display the size you choose
      # TODO: Add a thumbnail column to the users and save small pictures to that attribute
      if auth["provider"] == "twitter"
        user.username = auth["info"]["nickname"]
        user.user_image = auth["info"]["image"].sub("_normal", "")
      elsif auth["provider"] == "facebook"
        user.username = auth["info"]["name"]
        user.user_image = auth["info"]["image"].sub("picture","picture?type=large")
      end
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
