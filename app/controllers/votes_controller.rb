class VotesController < ApplicationController

  def show
    @venues = Group.find_by(id: params[:group_id]).venues
    render 'show.html.erb'
  end

  def create
  end
end
