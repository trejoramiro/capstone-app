# Venues Controller class #
class VenuesController < ApplicationController
  before_action :authenticate_user!

 # presents the searches.
 def index
   if params[:search]
     @group = Group.find_by(id: params[:group_id])
      if params[:location] == 'Enter Your Location' || params[:location] == 'Current Location'
        coordinates = "#{@group.latitude}" + ',' + "#{@group.longitude}"
        @x = @group.latitude
        @y = @group.longitude
      else
        loc = Geocoder.coordinates(params[:location])
        coordinates = loc[0].to_s + ',' + loc[1].to_s
        @x = loc[0]
        @y = loc[1]
      end
     data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=#{coordinates}&query=#{params[:search]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
     @query = params[:search]
     @venues = data['response']['groups'][0]['items']
     @url = 'https://maps.googleapis.com/maps/api/js?key=' + "#{ENV['G_KEY']}" + '&callback=initMap()'
     render 'search.html.erb'
   else
    # make sure to have the html send the group id params
    redirect_to "/groups/#{params[:group_id]}"
   end
 end

  def create
    length = params[:venue_ids].length
    index = 0
    total_venues = []

    length.times do
      venue_string = params[:venue_ids][index]
      @venue = Venue.new(
        name: venue_string.split('?')[0],
        location: venue_string.split('?')[1],
        group_id: params[:group_id],
        event_id: params['post']['event_id'],
        lat: venue_string.split('?')[2],
        lng: venue_string.split('?')[3]
      )
      @venue.save
      total_venues << @venue
      index += 1
    end
    redirect_to "/groups/#{params[:group_id]}"
  end
end
