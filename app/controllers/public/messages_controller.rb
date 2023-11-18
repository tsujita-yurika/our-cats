class Public::MessagesController < ApplicationController
    before_action :authenticate_member!

    def create
      @message = Message.new(message_params)
        if @message.save
          redirect_to "/rooms/#{@message.room_id}"
        end
    end

    private

    def message_params
      params.require(:message).permit(:body, :room_id).merge(member_id: current_member.id)
    end

end
