class SetListSong < ApplicationRecord
  acts_as_list
  belongs_to :set_list
  belongs_to :song
end
