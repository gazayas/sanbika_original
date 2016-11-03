module ApplicationHelper

  # これじゃなくてモデルにadminのboolを追加したい
  def admin
    current_user.name == 'gazayas'
  end

end
