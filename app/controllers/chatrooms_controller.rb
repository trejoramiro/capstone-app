class ChatroomsController < ApplicationController
    def create
        @chatroom = Chatroom.new
        @chatroom.group_id = params[:group_id]
    end

    def index
        # authenticate whether the user requesting this is the part of the chatroom
        @chatroom = Chatroom.find_by(group_id: 41)
        # make a call to the messages controller to obtain all the messages
        @messages = @chatroom.messages
        # binding.pry
        render 'show.html.erb'
    end
end
