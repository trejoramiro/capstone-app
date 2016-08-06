class GroupsController < ApplicationController

  def index
    if params[:search]
      loc = Geocoder.coordinates(params[:search])
      x = loc[0]
      y = loc[1]
      data = Unirest.get("https://api.foursquare.com/v2/venues/search?ll=#{x},#{y}&categoryId=4d4b7105d754a06374d81259&client_id=ENV['CLIENT_ID']&client_secret=ENV['CLIENT_SECRET']&v=20160806").body
      @venues = data["response"]["venues"]
      render 'search.html.erb'
    else
      @groups = Group.all
      render 'index.html.erb'
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @members = @group.users
    render 'show.html.erb'
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

end
