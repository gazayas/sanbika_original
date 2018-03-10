module ApplicationHelper
  Moji = Nihonjin::Moji.new

  def hiragana(str)
    Moji.hiragana(str)
  end

  def katakana(str)
    Moji.katakana(str)
  end

  def romaji(str)
    Moji.romaji(str)
  end
end
