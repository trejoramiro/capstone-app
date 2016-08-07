class VotesController < ApplicationController

  def show
    @group = Group.find_by(id: params[:group_id])
    @venues = @group.venues
    @event = Event.find_by(id: params[:event_id])
    render 'show.html.erb'
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    # @venue = @group.venues.where("id = ?", params[:venue])
    # @venue = @group.venues.find_by(id: params[:venue])
    @members = @group.users
    @members.each do |member|
      @vote = Vote.where(event_id: params[:event_id].to_i, user_id: member.id).first
      puts "************"
      p member.id
      p params[:event_id]
      p @vote
      puts "************"

      @vote.venue_id = params[:venue]

      Rails.logger.info @vote.attributes
      @vote.save
    end
    redirect_to "/groups/#{@group.id}"
  end

end
