class Song < ApplicationRecord

	belongs_to :user

  require 'nkf'

  validates :song_title, presence: true, length: { maximum: 50 }
  validates :song_yomikata, presence: true, length: { maximum: 70 }
  # artist と artist_yomikata はなくてもいいii
  validates :song_body, presence: true, length: { maximum: 7000000 }

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

end
