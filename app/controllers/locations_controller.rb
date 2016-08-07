class LocationsController < ApplicationController

  def create
    @group = Group.find_by(id: params[:group_id])
    puts "***********"
    puts params["coordinates"]["longitude"].to_f
    puts params["coordinates"]["latitude"].to_f
    puts "***********"
    @group.longitude = params["coordinates"]["longitude"].to_f
    @group.latitude = params["coordinates"]["latitude"].to_f
    @group.save
  end

end
