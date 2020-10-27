class SetListSong < ApplicationRecord
  belongs_to :set_list
  # belongs_to :user, through: :set_list
  belongs_to :song
end
