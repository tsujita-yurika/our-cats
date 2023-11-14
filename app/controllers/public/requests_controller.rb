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

