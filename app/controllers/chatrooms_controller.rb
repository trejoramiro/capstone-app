class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.new()
    @chatroom.group_id = params[:group_id]
  end

  def show
    @chatroom = Chatroom.find_by(group_id: 41)
    @message = Message.new()
    render 'show.html.erb'
  end
end
