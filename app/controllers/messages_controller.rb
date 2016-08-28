class MessagesController < ApplicationController

  def index
    @messages = Message.where(chatroom_id: params[:chatroom_id]).includes(:user).all
    return 'index.json.jbuilder'
  end
end
