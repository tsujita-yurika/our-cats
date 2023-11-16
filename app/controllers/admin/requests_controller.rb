class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @my_cats = @request.cats
  end
end
