class Admin::RoomsController < ApplicationController

  def index
    @rooms = Room.page(params[:page]).per(18)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.page(params[:page]).per(10)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_rooms_path, notice: "メッセージルームが削除されました"
  end

end
