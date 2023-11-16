class Admin::CatsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @cats = Cat.all.page(params[:page]).per(12)
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
