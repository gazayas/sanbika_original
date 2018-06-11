class Rating < ApplicationRecord
  belongs_to :song
  belongs_to :use
end
