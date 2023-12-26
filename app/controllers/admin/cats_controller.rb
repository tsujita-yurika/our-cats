class Admin::CatsController < ApplicationController
  # before_action set_catで@catを準備し共通化する
  before_action :set_cat, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @cats = Cat.page(params[:page]).per(8)
    @cat_count = Cat.count
  end

  def show
  end

  def edit
  end

  def update
    @cat.update(cat_params)
    redirect_to admin_cat_path(@cat.id), notice: "更新しました。"
  end

  def destroy
    @cat.destroy
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

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
