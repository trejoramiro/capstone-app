class GroupsController < ApplicationController

  def index
      @groups = Group.all
      render 'index.html.erb'
  end

  def show
    if params[:search]
      @group = Group.find_by(id: params[:id])
      loc = Geocoder.coordinates("1920 West Superior St., Chicago, IL")
      x = loc[0]
      puts x
      y = loc[1]
      puts y
      data = Unirest.get("https://api.foursquare.com/v2/venues/search?ll=#{x},#{y}&categoryId=4d4b7105d754a06374d81259&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20160807").body
      @venues = data["response"]["venues"]
      puts "Hello"
      puts @venues
      render 'search.html.erb'
    else
      @group = Group.find_by(id: params[:id])
      @members = @group.users
      @venues = @group.venues
      @events = @group.events
      render 'show.html.erb'
    end
  end

  def new
    render 'new.html.erb'
  end

  def add
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
  puts "***********"
  puts params["coordinates"]["longitude"].to_f
  puts params["coordinates"]["latitude"].to_f
  puts "***********"
  @group.longitude = params["coordinates"]["longitude"].to_f
  @group.latitude = params["coordinates"]["latitude"].to_f
  @group.save
  puts "Data successfully saved."
  end
end
