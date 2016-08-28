class Api::V1::MessagesController < ApplicationController

  def create
    @message = Message.create(
    content: params[:body],
    chatroom_id: 1,
    user_id: current_user.id)
    ActionCable.server.broadcast 'messages_channel', {
      id: @message.id,
      name: @message.user.username,
      body: @message.content
    }
    # binding.pry
    #render 'show.json.jbuilder'
    # render :nothing => true
    # head :ok
    render 'show.json.jbuilder'
  end

  def index
    @messages = Chatroom.find_by(id: 1).messages
    return 'index.json.jbuilder'
  end

end
