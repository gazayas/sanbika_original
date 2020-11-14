class SetList < ApplicationRecord
  belongs_to :user
  has_many :set_list_songs, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 25 }

  # It may be a better practice to add limit: 10 to this,
  # but since the set list songs are being saved in their own controller,
  # the create function handles the logic there.
  accepts_nested_attributes_for :set_list_songs
end
