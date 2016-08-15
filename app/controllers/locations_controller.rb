class LocationsController < ApplicationController

before_action :authenticate_user!

  def create
    @group = Group.find_by(id: params[:group_id])
    @group.longitude = params["coordinates"]["longitude"].to_f
    @group.latitude = params["coordinates"]["latitude"].to_f
    @group.save
  end
end
