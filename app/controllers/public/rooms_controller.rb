class Public::RoomsController < ApplicationController
    before_action :authenticate_member!
    before_action :restrict_room_access, only: [:show]

    def create
      @room = Room.create
       # ルームidが新しい部屋のidに対してメンバーidがカレントメンバーid
      Entry.create(room_id: @room.id, member_id: current_member.id, request_id: params[:request_id])
      redirect_to "/rooms/#{@room.id}"
    end

    def show
      @room = Room.find(params[:id])
      @messages = @room.messages.page(params[:page]).per(10)
      @message = Message.new
      @entries = @room.entries
    end

    private

    def restrict_room_access
      #リクエストされたルームのIDを取得
      room_id = params[:id]
      #エントリー情報を取得
      entry = Entry.find_by(room_id: room_id)
      # エントリーがない場合
      if entry.nil?
        flash[:notice] = "このルームへのアクセスは制限されています。"
        redirect_to root_path and return
      end
      # if entry.request.member_id != current_member.id || entry.member_id != current_member.id
      # 依頼を受ける人と依頼主のmember_idが含まれていない場合
      unless [entry.request.member_id, entry.member_id].include?(current_member.id)
        flash[:notice] = "このルームへのアクセスは制限されています。"
        redirect_to root_path and return
      end
    end

end