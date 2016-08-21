class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user_id = current_user
    if message.save
      # do some stuff
    else
      # redirect to chatrooms path
    end
  end
end
