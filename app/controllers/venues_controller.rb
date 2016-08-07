class VenuesController < ApplicationController

  def create
    @group = Group.find_by(id: params[:group_id])
    @venue = Venue.new(
      name: params[:venue_name],
      location: params[:location],
      group_id: params[:group_id])
    @venue.save
    redirect_to "/groups/#{@group.id}"
  end
end
