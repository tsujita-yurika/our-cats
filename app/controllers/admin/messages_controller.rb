class Admin::MessagesController < ApplicationController

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_room_path(@message.room_id), notice: "メッセージを削除しました。"
  end

end