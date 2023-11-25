class Public::RequestsController < ApplicationController
before_action :is_request_matching_login_member, only: [:edit, :update, :destroy]

  def new
    @request = Request.new
    @my_cats = current_member.cats
  end

  def index
    @requests = Request.page(params[:page]).per(12)
    @request_count = Request.count
  end

  def show
    @request = Request.find(params[:id])
    @my_cats = @request.cats
    if member_signed_in?
      @entries = current_member.entries
      @my_entry = @entries.find_by(request_id: @request.id)
    end
    @entry_lists = @request.entries

    @room = Room.new
    @entry = Entry.new
    # ルーム、エントリーを新しく作る
    if @request.member.is_active == false
      render_404
    end
  end

  def edit
    @request = Request.find(params[:id])
    @my_cats = current_member.cats
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    redirect_to request_path(request.id), notice: "更新しました。"
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
    request = Request.find(params[:id])
    request.is_complete = true
    request.save
    redirect_to member_path(current_member.id), notice: "依頼が完了しました。"
  end

  private

  def request_params
    params.require(:request).permit(:season, :days, :location, :memo, cat_ids: [] )
  end

  def is_request_matching_login_member
    request = Request.find(params[:id])
    unless request.member == current_member
      flash[:notice] = "この依頼の編集は許可されていません。"
      redirect_to root_path and return
    end
  end

end
