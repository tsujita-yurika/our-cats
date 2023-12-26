class Admin::RequestsController < ApplicationController
  # before_action set_requestで@requestを準備し共通化する
  before_action :set_request, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @requests = Request.page(params[:page]).per(8)
    @request_count = Request.count
  end

  def show
    @my_cats = @request.cats
  end

  def edit
    @member = @request.member
    @my_cats = @member.cats
  end

  def update
    @request.update(request_params)
    redirect_to admin_request_path(@request.id), notice: "更新しました。"
  end

  def destroy
    @request.destroy
    redirect_to admin_requests_path, notice: "削除しました。"
  end

  def complete
    @request.is_complete = true
    @request.save
    redirect_to admin_request_path(@request), notice: "募集を終了しました。"
  end



  private

  def request_params
    params.require(:request).permit(:season,
                                    :days,
                                    :location,
                                    :memo,
                                    cat_ids: [] )
  end

  def set_request
    @request = Request.find(params[:id])
  end

end
