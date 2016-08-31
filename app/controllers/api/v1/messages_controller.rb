# Messages controller create and index routes
class Api::V1::MessagesController < ApplicationController
  def create
    @message = Message.create(
      content: params[:body],
      chatroom_id: 1,
      user_id: current_user.id
    )
    ActionCable.server.broadcast 'messages_channel',
        id:   @message.id,
        name: @message.user.username,
        body: @message.content
    render 'show.json.jbuilder'
  end

  def index
    @messages = Chatroom.find_by(id: 1).messages.last(12)
    'index.json.jbuilder'
  end
end
