class EventsController < ApplicationController


  def new
    render 'new.html.erb'
  end

  def create
    @event = Event.new(
      name: params[:name],
      capacity: params[:capacity],
      start_time: params[:start_time],
      end_time: params[:end_time],
      description: params[:description]
      )
    @event.save
    redirect_to "/groups"
  end


  def edit
    @event = Event.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @event.assign_attributes({
      ame: params[:name],
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
