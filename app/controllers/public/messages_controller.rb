class Public::MessagesController < ApplicationController
    before_action :authenticate_member!

    def create
      #if Entry.where(member_id: current_member.id, room_id: params[:message][:room_id]).present?

        @message = Message.new(message_params)
        if @message.save
            redirect_to "/rooms/#{@message.room_id}"
        end
      #else
      #  redirect_back(fallback_location: root_path)
      #end
    end

    private
    def message_params
        params.require(:message).permit(:body, :room_id).merge(member_id: current_member.id)
    end
end
