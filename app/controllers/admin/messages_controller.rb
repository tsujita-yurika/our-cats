class Admin::MessagesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_room_path(@message.room_id), notice: "メッセージを削除しました。"
  end

end