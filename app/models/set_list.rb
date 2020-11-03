class SetList < ApplicationRecord
  belongs_to :user
  has_many :set_list_songs, dependent: :destroy
end
