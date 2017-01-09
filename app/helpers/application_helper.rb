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

  # これじゃなくてモデルにadminのboolを追加したい
  def admin
    if current_user # && current_user.admin
      current_user.name == 'gazayas' # これを消すこと
    end
  end

end
