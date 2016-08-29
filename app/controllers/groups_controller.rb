# Groups Controller #
class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find_by(id: current_user.id)
    @groups = user.groups
    @members = {}
    @events = {}
    @groups.each do |group|
      @members[group.id.to_s] = group.users.limit(2)
      @events [group.id.to_s] = group.events.order(:start_time).first
    end
    # binding.pry
    render 'index.html.erb'
  end

  def show
    @group = Group.find_by(id: current_user.id)
    @members = @group.users
    @events = @group.events

    venue_list = []
    @vote_hash = {}
    @venues = {}
    @events.each do |event|
        @venues[event.id.to_s] = event.venues
        @vote_hash[event.id]
      venue_hash = {}
      event.venues.each do |venue|
          votes = venue.votes.count
        venue_hash[venue.id] = votes
      end
      venue_list.push(venue_hash)
    end
    @vote_hash[@group.id] = venue_list
    # binding.pry
    render 'show.html.erb'
  end

  def new
      render 'new.html.erb'
  end

  def create
    @group = Group.new(
        name: params[:name],
        location: params[:location]
)
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
    name: params[:name],
      location: params[:location]
)
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
  @group.longitude = params['coordinates']['longitude'].to_f
  @group.latitude = params['coordinates']['latitude'].to_f
  @group.save
  end
end
