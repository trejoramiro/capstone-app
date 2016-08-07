class Event < ApplicationRecord
  belongs_to :group
  has_many :venues
  has_many :votes

end
