class Public::CatsController < ApplicationController
  before_action :is_cat_matching_login_member, only: [:edit, :update, :destroy]

  def new
    @cat = Cat.new
  end

  def index
    @cats = Cat.page(params[:page]).per(12)
    @cat_count = Cat.count
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat.member.is_active == false
      render_404
    end
  end

  def edit
    @cats = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)
    redirect_to cat_path(cat.id), notice: "更新しました。"
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.member_id = current_member.id
    @cat.category_id = cat_params[:category_id]
    if @cat.save
      redirect_to cat_path(@cat), notice: "登録しました。"
    else
      render :new
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    redirect_to member_path(current_member.id), notice: "削除しました。"
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

  def is_cat_matching_login_member
    cat = Cat.find(params[:id])
    unless cat.member == current_member
      flash[:notice] = "この猫の編集は許可されていません。"
      redirect_to root_path and return
    end
  end

end
