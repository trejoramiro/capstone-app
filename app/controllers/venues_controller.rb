class VenuesController < ApplicationController

  def create
    @group = Group.find_by(id: params[:group_id])
    redirect_to "/groups/#{@group.id}"
  end
end
