class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit]

  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @cat = Cat.new
    @requests = @member.requests.includes(:entries)
    # メンバーのリクエストをエントリー含めてすべて取得
    @entries = @member.entries
    # メンバーに紐づくエントリーズ（依頼を渡す人・依頼を受ける人のエントリー）
    if @member.is_active == false
      render_404
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.profile_image.attach(params[:member][:profile_image])
    if @member.update(member_params)
      redirect_to member_path(@member.id), notice: "更新しました。"
    else
      render 'edit'
    end
  end

  def withdraw
    @member = Member.find(current_member.id)
    @member.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を行いました。"
    redirect_to root_path
  end

 private

  def member_params
    params.require(:member).permit(:profile_image,
                                  :name,
                                  :sex,
                                  :email,
                                  :encrypted_password,
                                  :prefectures,
                                  :real_name,
                                  :phone_number,
                                  :address,
                                  :identification_status,
                                  :is_active,
                                  :image
                                  )
  end

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
