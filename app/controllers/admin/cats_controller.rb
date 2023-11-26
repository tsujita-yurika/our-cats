class Admin::CatsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @cats = Cat.page(params[:page]).per(8)
    @cat_count = Cat.count
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cats = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)
    redirect_to admin_cat_path(cat.id), notice: "更新しました。"
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    redirect_to admin_cats_path, notice: "削除しました。"
  end

  private

  def cat_params
    params.require(:cat).permit(:name,
                                :sex,
                                :age,
                                :category_id,
                                :introduction,
                                :image)
  end

end
