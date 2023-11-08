class Public::MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @cat = Cat.new
  end

  def edit
  end
end
