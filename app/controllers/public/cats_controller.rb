class Public::CatsController < ApplicationController

  def new
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cats = Cat.find(params[:id])
  end

  def index
    @cats = Cat.all.page(params[:page]).per(12)
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(cat_params)
    redirect_to cat_path(cat.id)
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.member_id = current_member.id
    if @cat.save
      redirect_to cat_path(@cat), notice: "登録しました。"
    else
      render :new
    end
  end

  def destroy
    cat = Cat.find(params[:id])  # データ（レコード）を1件取得
    cat.destroy  # データ（レコード）を削除
    redirect_to '/cats'  # 投稿一覧画面へリダイレクト
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :sex, :age, :category, :introduction, :image)
  end

end
