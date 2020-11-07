class SetList < ApplicationRecord
  belongs_to :user
  has_many :set_list_songs, dependent: :destroy

  accepts_nested_attributes_for :set_list_songs
end
