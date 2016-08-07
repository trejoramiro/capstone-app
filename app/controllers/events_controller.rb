class EventsController < ApplicationController


  def new
    @group = Group.find_by(id: params[:group_id])
    render 'new.html.erb'
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    date = DateTime.iso8601('1751-04-23', Date::ENGLAND)
    @event = Event.new(
      name: params[:name],
      capacity: params[:capacity],
      start_time: date,
      end_time: date,
      description: params[:description],
      group_id: @group.id
      )
    @event.save
    members = @group.users
    members.each do |member|
      ballet = Vote.new(
        user_id: member.id,
        group_id: @group.id,
        event_id: @event.id
        )
      ballet.save
    end

    redirect_to "/groups/#{@group.id}"
  end


  def edit
    @event = Event.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @event.assign_attributes({
      name: params[:name],
      capacity: params[:capacity],
      start_time: params[:start_time],
      end_time: params[:end_time],
      description: params[:description]
      })
    @event.save
    redirect_to "/groups"
  end

  def delete
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to "/groups"
  end

end
