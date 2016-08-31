class MessagesController < ApplicationController

  def index
    @messages = Message.where(chatroom_id: params[:chatroom_id]).includes(:user).order(id: :desc).limit(10)
    return 'index.json.jbuilder'
  end
end
