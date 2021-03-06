class VotesController < ApplicationController
    before_action :authenticate_user!

    def show
        @group = Group.find_by(id: params[:group_id])
        @event = Event.find_by(id: params[:event_id])
        @venues = @event.venues
        render 'show.html.erb'
    end

    def update
        @group = Group.find_by(id: params[:group_id])
        @vote = Vote.where(event_id: params[:event_id].to_i, user_id: current_user.id).first
        @vote.venue_id = params[:venue].to_i
        @vote.save

        redirect_to "/groups/#{@group.id}"
    end
end
