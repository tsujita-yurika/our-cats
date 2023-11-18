class Admin::RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_room_path(@message.room_id), notice: "メッセージを削除しました。"
  end
end
