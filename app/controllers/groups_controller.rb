class GroupsController < ApplicationController

before_action :authenticate_user!

  def index
      @groups = Group.all
      render 'index.html.erb'
  end

  def show
    if params[:search]
      @group = Group.find_by(id: params[:id])
      if params[:location] == "Enter Your Location" || params[:location] == "Current Location"
        coordinates = "#{@group.latitude}" + "," + "#{@group.longitude}"
        @x = @group.latitude
        @y = @group.longitude
      else
        loc = Geocoder.coordinates(params[:location])
        coordinates = "#{loc[0]}" + "," + "#{loc[1]}"
        @x = loc[0]
        @y = loc[1]
      end
      data = Unirest.get("https://api.foursquare.com/v2/venues/explore?ll=#{coordinates}&query=#{params[:search]}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160809").body
      @query = params[:search]
      @venues =  data["response"]["groups"][0]["items"]
      @url = "https://maps.googleapis.com/maps/api/js?key=" + "#{ENV['G_KEY']}" + "&callback=initMap"
      #binding.pry
      render 'search.html.erb'
    else
      @group = Group.find_by(id: params[:id])
      @members = @group.users
      @venues = @group.venues
      @events = @group.events

      @vote_hash = {}
      venue_list = []
      @events.each do |event|
        @vote_hash[event.id]
        venue_hash = {}
        event.venues.each do |venue|
          votes = venue.votes.count
          venue_hash[venue.id] = votes
        end
        venue_list.push(venue_hash)
      end
      @vote_hash[@group.id] = venue_list
      #binding.pry
      render 'show.html.erb'
    end
  end

  def new
    render 'new.html.erb'
  end

  def create
     @group = Group.new(
      name: params[:name],
      location: params[:location])
     @group.save
    redirect_to "/groups/#{@group.id}"
  end

  def edit
    @group = Group.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.assign_attributes(
    { name: params[:name],
      location: params[:location]
      })
    @group.save
    redirect_to "/groups/#{@group.id}"
  end

  def delete
    group = Group.find_by(id: params[:id])
    group.destroy
    redirect_to '/groups'
  end

  def create
  @group = Group.find_by(id: params[:group_id])
  @group.longitude = params["coordinates"]["longitude"].to_f
  @group.latitude = params["coordinates"]["latitude"].to_f
  @group.save
  end
end
