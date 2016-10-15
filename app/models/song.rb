class Song < ApplicationRecord

  require 'nkf'

	belongs_to :user

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
