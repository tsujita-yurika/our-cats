class Public::MessagesController < ApplicationController
    before_action :authenticate_member!

  def create
    @message = Message.new(message_params)
    @room = Room.find(@message.room_id)
    @messages = @room.messages.page(params[:page]).per(10)

    if @message.save
      respond_to do |format|
        format.js
      end
    else
      @errors = @message.errors.full_messages
      respond_to do |format|
        format.js { render 'public/messages/error.js' }
        format.html do
          flash[:error] = @errors.join(", ")
          redirect_to request.referer
        end
      end
    end
  end

  private

  def message_params
      params.require(:message).permit(:body, :room_id).merge(member_id: current_member.id)
  end
end
