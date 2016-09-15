class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  has_many :votes
  has_many :venues
  has_many :visits

  has_many :events

  has_one :chatroom

  def events_vote_percentage(current_user_id)
    events = self.events
    results = {}
    events.each do |event|
      votes = Vote.find_by(event_id: event.id)
      total = votes.count
      voting = 0
      votes.each do |vote|
        if vote.venue_id
          voting = voting + 1
        end
      end
      percentage = (votes / total) * 100
      results["#{event.id}"] = percentage
    end
  end

  def chosen_venue
    venue = events.first.venues.find_by(chosen: true)
    "#{venue.lat},#{venue.lng}"
  end

end
