class Venue < ApplicationRecord
  belongs_to :group
  has_many :votes
  belongs_to :event
end
