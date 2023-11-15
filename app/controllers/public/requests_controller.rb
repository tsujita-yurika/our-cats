class Public::RequestsController < ApplicationController

  def new
    @request = Request.new
    @my_cats = current_member.cats
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @my_cats = @request.cats
    
    @entries = current_member.entries
    @my_entry = @entries.find_by(request_id: @request.id)
    
    @entry_lists = @request.entries
    #byebug

    # @currentMemberEntry = Entry.where(member_id: current_member.id)
    # @requestMemberEntry = Entry.where(member_id: @request.member_id)
    # # 16・17行目でログインしている会員と依頼主のエントリーを集める
    # @currentMemberEntry.each do |curren_member_entry|
    #   @requestMemberEntry.each do |request_member_entry|
    # # 集めたエントリーを回して、同じルームidを持つーエントリーがあるか確認
    #     if curren_member_entry.room_id == request_member_entry.room_id then
    #       # お互いのエントリーの持つルームidが一致したら次に行く
    #       @isRoom = true
    #       # ルームがある
    #       @roomId = curren_member_entry.room_id
    #       # カレントメンバーのエントリーのルームidを取得する
    #     end
    #   end
    # end

    # if @isRoom != true
    #   # もしもルームがなかったら
       @room = Room.new
       @entry = Entry.new
    #   # ルーム、エントリーを新しく作る
    # end

  end

  def edit
    @request = Request.find(params[:id])
    @my_cats = current_member.cats
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    redirect_to request_path(request.id)
  end

  def create
    @request = Request.new(request_params)
    @request.member_id = current_member.id
    if @request.save
      redirect_to request_path(@request), notice: "依頼しました。"
    else
      render :new
    end
  end

  def destroy
    request = Request.find(params[:id])  # データ（レコード）を1件取得
    request.destroy  # データ（レコード）を削除
    redirect_to '/requests'  # 投稿一覧画面へリダイレクト
  end

  private

  def request_params
    params.require(:request).permit(:season, :days, :location, :memo, cat_ids:[] )
  end

end

