class Restaurant < ApplicationRecord
  belongs_to :group, optional: true
  has_many :votes
  has_many :visits
  has_many :events
end
