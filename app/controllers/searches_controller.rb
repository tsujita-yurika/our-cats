class SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Category"
      @categories = Category.looks(params[:search], params[:word])
    else
      @members = Member.looks(params[:search], params[:word])
    end
  end

end
