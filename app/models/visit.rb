class Visit < ApplicationRecord
  belongs_to :users
  belongs_to :groups
  belongs_to :restaurants
end
