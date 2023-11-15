class Admin::CatsController < ApplicationController

  def index
    @cats = Cat.all.page(params[:page]).per(12)
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
