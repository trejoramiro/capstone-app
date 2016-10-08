# Groups Controller #
class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find_by(id: current_user.id)
    @groups = user.groups
    @members = {}
    @events = {}
    @groups.each do |group|
      @members[group.id.to_s] = group.users.limit(4)
      if group.events.order(:start_time).first != nil
      @events[group.id.to_s] = group.events.order(:start_time).first
      end
    end
    @meeting = []
    meeting  = user.groups.first.events.order(date: :desc).first
    @meeting << meeting

    # binding.pry
    render 'index.html.erb'
  end

  def show
    @group = Group.find_by(id: params[:id])
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
    @venue_list = venue_list
    # binding.pry
    render 'show.html.erb'
  end

  def new
      render 'new.html.erb'
  end

  # def create
  #   @group = Group.new(
  #       name: params[:name],
  #       location: params[:location]
  #       )
  #   @group.save
  #   redirect_to "/groups/#{@group.id}"
  # end

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
    coord = Geocoder.coordinates(params[:location])
    @group = Group.new(name: params[:name])
    @group.vote_status = "Active"
    @group.location = params[:location]
    @group.longitude = coord[0]
    @group.latitude = coord[1]
    @group.save

    user = User.find_by(id: current_user.id)
    @groups = user.groups

    @chatroom = Chatroom.new(group_id: @group.id)
    @chatroom.save

    @groupusers = GroupUser.new(group_id: @group.id, user_id: current_user.id)
    @groupusers.save

    redirect_to "/groups/#{@group.id}"
  end
end
