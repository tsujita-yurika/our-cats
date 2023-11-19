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
end
