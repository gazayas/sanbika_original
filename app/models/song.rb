class Song < ApplicationRecord

	belongs_to :user
	before_save :prep_yomikata
	before_update :prep_yomikata

  validates :title, presence: true, length: { maximum: 50 }
  validates :title_yomikata, presence: true, length: { maximum: 70 }
	validates :artist, length: { maximum: 70 } # , presence: true
	validates :artist_yomikata, length: { maximum: 70 } # , presence: true
  validates :song_body, presence: true, length: { maximum: 7000000 }

	private

	def prep_yomikata
		moji = Nihonjin::Moji.new

		prep = Proc.new do |str|
			str = moji.hiragana(str)
			str = moji.kiru(str)
		end

		self.title_yomikata = prep.call(self.title_yomikata)
		self.artist_yomikata = prep.call(self.artist_yomikata)

		self
	end

end
