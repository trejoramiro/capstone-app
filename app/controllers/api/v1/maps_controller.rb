class Api::V1::MapsController < ApplicationController
  def index
    groups = current_user.groups
    @data = []
    groups.each do |group|
        event = group.events.first
        chosen_venue = event.venues.find_by(chosen: TRUE)
        hash = {}
        hash["id"] = group.id
        hash["lat"] = chosen_venue.lat
        hash["lng"] = chosen_venue.lng
        @data.push(hash)
    end
    render 'index.json.jbuilder'
  end
end
