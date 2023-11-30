class Public::MessagesController < ApplicationController
    before_action :authenticate_member!

  def create
    @message = Message.new(message_params)

     @room = Room.find(@message.room_id)
     @messages = @room.messages.page(params[:page]).per(10)

    if @message.save
      render 'public/messages/create.js'

      # redirect_to request.referer
    else
      flash[:error] = @message.errors.full_messages.join(", ")
      redirect_to request.referer
    end
  end

  private

  def message_params
      params.require(:message).permit(:body, :room_id).merge(member_id: current_member.id)
  end
end
