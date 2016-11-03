module ApplicationHelper

  # これじゃなくてモデルにadminのboolを追加したい
  def admin
    if current_user
      current_user.name == 'gazayas'
    end
  end

end
