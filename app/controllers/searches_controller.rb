class SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @search_results = Cat.joins(:category).where("categories.name LIKE ?", "%#{params[:search]}%")
    @search_count = @search_results.count
  end

end
