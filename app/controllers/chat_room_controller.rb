class ChatRoomsController < ApplicationController
    def index
        @chat_rooms = ChatRoom.all 
    end
    
    def new
        @chat_room = ChatRoom.new
    end

    def create
        @chat_room = current_user.chat_rooms.build(chat_room_params)
        if @chat_room.save
          flash[:success] = "Sala de chat creada"
          redirect_to @chat_rooms_path
        else
          #flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def chat_room_params
        params.require(:chat_room).permit(:title)
    end
    
    
    
end