module ApplicationHelper

  # これじゃなくてモデルにadminのboolを追加したい
  def admin
    if current_user # && current_user.admin
      current_user.name == 'gazayas' # これを消すこと
    end
  end

end
