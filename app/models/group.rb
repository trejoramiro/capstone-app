class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  has_many :votes
  has_many :restaurants
  has_many :visits

  has_many :events
end

