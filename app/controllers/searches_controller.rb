class SearchesController < ApplicationController

  def search
    @search_results = Cat.joins(:category).where("categories.name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(12)
    @search_count = @search_results.count
  # LIKE ?を使用して、categories.nameカラムとparams[:search]を部分一致検索
  # @search_results.countを使用して検索結果の件数を取得し、`@search_count`に代入
  end

end
