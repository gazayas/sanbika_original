# お気に入り

class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :song
end
