class VenuesController < ApplicationController

  def create
    length = params[:venue_ids].length
    index = 0
    total_venues = []

    length.times do
      venue_string = params[:venue_ids][index]
      #binding.pry
      @venue = Venue.new(
        name: venue_string.split("?")[0],
        location: venue_string.split("?")[1],
        group_id: params[:group_id],
        event_id: params["post"]["event_id"],
        lat: venue_string.split("?")[2],
        lng: venue_string.split("?")[3])
      @venue.save
      total_venues << @venue
      index += 1
    end
    redirect_to "/groups/#{params[:group_id]}"
  end

end
