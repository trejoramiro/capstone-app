class Event < ApplicationRecord
  belongs_to :group
  has_many :venues
  has_many :votes

  def current_user_voted_on(user_id)
    vote = Vote.find_by(user_id: user_id, event_id: self.id)
    if vote
      venue = Venue.find_by(id: vote.venue_id)
      return venue
    else
    return nil
    end
  end

end
