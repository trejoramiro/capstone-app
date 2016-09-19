# Venues Controller class #
class VenuesController < ApplicationController
    before_action :authenticate_user!

    # presents the searches.
    def index
            @group = Group.find_by(id: params[:group_id])
            # if params[:location] == 'Enter Your Location' || params[:location] == 'Current Location'
            #     coordinates = @group.latitude.to_s + ',' + @group.longitude.to_s
            #     @x = @group.latitude
            #     @y = @group.longitude
            # elsif
            location = Geocoder.coordinates(params[:location])
            @coordinates = location[0].to_s + ',' + location[1].to_s
            @x = location[0]
            @y = location[1]

            data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=#{@coordinates}&query=#{params[:search]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
            @query = params[:search]
            # @venues = data['response']['groups'][0]['items']
            # @url = 'https://maps.googleapis.com/maps/api/js?key=' + (ENV['G_KEY']).to_s + '&callback=initMap()'
            # render 'search.html.erb'
            @events = @group.events
            render "example.html.erb"
            # redirect_to "/example/#{coordinates}/#{@query}"
    end

    def create
        length = params[:venue_ids].length
        index = 0
        total_venues = []

        length.times do
            @venue = Venue.new(
            name: params[:venue_ids][index]["name"],
            location: params[:venue_ids][index]["location"],
            group_id: params[:group_id],
            event_id: params[:event_id].to_i,
            lat: params[:venue_ids][index]["lat"],
            lng: params[:venue_ids][index]["lng"],
            chosen: FALSE
            )
            @venue.save
            total_venues << @venue
            index += 1
        end
        # binding.pry
        # redirect_to "/groups/#{params[:group_id]}"
        render json: {group_id: params[:group_id]}
        # binding.pry
    end
end
