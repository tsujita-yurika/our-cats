class Admin::CatsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @cats = Cat.page(params[:page]).per(12)
    @cat_count = Cat.count
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
