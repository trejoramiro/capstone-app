class Api::V1::MapsController < ApplicationController
  def index
    groups = current_user.groups
    @data = []
    groups.each do |group|
        event = group.events.first
        hash = {}
        hash["id"] = group.id
        hash["lat"] = -34.397
        hash["lng"] = 150.644
        @data.push(hash)
    end
    # binding.pry
    render 'index.json.jbuilder'
  end
end
