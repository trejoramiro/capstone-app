class Event < ApplicationRecord
  belongs_to :group
  belongs_to :venue, optional: true
  has_many :votes

end
