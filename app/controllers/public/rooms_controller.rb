class Public::RoomsController < ApplicationController
    before_action :authenticate_member!

    def create
      @room = Room.create
      Entry.create(room_id: @room.id, member_id: current_member.id, request_id: params[:request_id])
      # ルームidが新しい部屋のidに対してメンバーidがカレントメンバーid
      redirect_to "/rooms/#{@room.id}"
    end

    def show
      @room = Room.find(params[:id])
      @messages = @room.messages.page(params[:page]).per(10)
      @message = Message.new
      @entries = @room.entries
    end
end