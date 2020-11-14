class SetList < ApplicationRecord
  belongs_to :user
  has_many :set_list_songs, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 25 }

  # TODO: Write limit: 10 for this validation
  accepts_nested_attributes_for :set_list_songs
end
