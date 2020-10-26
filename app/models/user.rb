class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  has_many :songs, dependent: :destroy
  has_many :set_lists, dependent: :destroy
  has_many :favorites
  has_one :song, through: :favorites
  accepts_nested_attributes_for :favorites

  # TODO: Use carrierwave to edit user images
  # mount_uploader :user_image, UserImageUploader

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
      elsif auth["provider"] == "google_oauth2"
        user.username = auth["info"]["name"]
        user.user_image = auth["info"]["image"].sub(/=s\d+/, "=s300")
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
