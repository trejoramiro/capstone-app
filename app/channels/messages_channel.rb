class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # Subscribe to messages channel on server side
    stream_from 'messages_channel'
  end

  def unsubscribed
  end

end
