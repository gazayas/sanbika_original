class Song < ApplicationRecord
	belongs_to :user
	has_many :ratings, through: :user

	VIDEO_REGEXP = /\A(http)?(s)?(:\/\/)?(www\.youtube\.com\/watch\?v=)|(youtu\.be\/)(.*)\z/

 	validates :title, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
	validates :artist, length: { maximum: 50 }
	validates :key, presence: true, length: { maximum: 2 }
	validates :song_body, presence: true, length: { maximum: 7_000_000 }
	validates :video, :check_link, length: { maximum: 300 }

	#TODO: Upcaseかdowncase、どちらでも適切にマッチするように
	def self.search(search)
		if search
      		where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示
    	else
    		all #全て表示
    	end
	end

	private

	def check_link
		errors.add(:video, I18n.t(:invalid_link)) unless video == "" || !!video.match(VIDEO_REGEXP)
	end
end
