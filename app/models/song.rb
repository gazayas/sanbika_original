class Song < ApplicationRecord

	belongs_to :user
	before_save :all_characters_to_hiragana

  validates :title, presence: true, length: { maximum: 50 }
  validates :title_yomikata, presence: true, length: { maximum: 70 }
  validates :song_body, presence: true, length: { maximum: 7000000 }

	private

	def all_characters_to_hiragana
		moji = Nihonjin::Moji.new
		self.title_yomikata  = moji.hiragana(str)
		self.artist_yomikata = moji.hiragana(str)
		self
	end

=begin
  # index.html.erbとかで並べる時に次のメソッドが使える
  def self.hiragana_to_katakana(str)
    str = NKF.nkf('-h2 -w', str)
  end

  def self.katakana_to_hiragana(str)
    str = NKF.nkf('-h3 -w', str)
  end

  def self.no_space(str)
    str = NKF.nkf('-Z1 -w', str)
    str = str.gsub(/\s/, "")
  end
=end

end
