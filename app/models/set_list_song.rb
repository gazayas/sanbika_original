class SetListSong < ApplicationRecord
  belongs_to :set_list
  belongs_to :song

  validates_uniqueness_of :song_id, scope: :set_list_id
  validates :key, presence: true
end
