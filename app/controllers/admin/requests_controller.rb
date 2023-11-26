class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @requests = Request.page(params[:page]).per(12)
    @request_count = Request.count
  end

  def show
    @request = Request.find(params[:id])
    @my_cats = @request.cats
  end

  def edit
    @request = Request.find(params[:id])
    @member = @request.member
    @my_cats = @member.cats
  end

  def update
    request = Request.find(params[:id])
    request.update(request_params)
    redirect_to admin_request_path(request.id), notice: "更新しました。"
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to admin_requests_path, notice: "削除しました。"
  end

  def complete
    request = Request.find(params[:id])
    request.is_complete = true
    request.save
    redirect_to admin_request_path(request), notice: "依頼が完了しました。"
  end



  private

  def request_params
    params.require(:request).permit(:season,
                                    :days,
                                    :location,
                                    :memo,
                                    cat_ids: [] )
  end


end
