class Song < ApplicationRecord
	belongs_to :user

	VIDEO_REGEXP = /\A(http)?(s)?(:\/\/)?(www\.youtube\.com\/watch\?v=)|(youtu\.be\/)(.*)\z/

    validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
	validates :artist, length: { maximum: 50 }
	validates :key, presence: true, length: { maximum: 2 }
    validates :song_body, presence: true, length: { maximum: 7_000_000 }
	validates :video, :check_link, length: { maximum: 300 }

	private

	def check_link
		errors.add(:video, I18n.t(:invalid_link)) unless video == "" || !!video.match(VIDEO_REGEXP)
	end
end
