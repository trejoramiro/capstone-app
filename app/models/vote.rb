class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :group
end
