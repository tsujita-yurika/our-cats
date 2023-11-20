class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit]

  def index
  end

  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @cat = Cat.new
    @requests = @member.requests.includes(:entries)
    # メンバーのリクエストをエントリー含めてすべて取得
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.profile_image.attach(params[:member][:profile_image])
    if @member.update(member_params)
      redirect_to member_path(@member.id)
    else
      render 'edit'
    end
  end

 private

  def member_params
    params.require(:member).permit(:name,
                                  :sex,
                                  :email,
                                  :encrypted_password,
                                  :real_name,
                                  :phone_number,
                                  :address, :prefectures,
                                  :identification_status,
                                  :is_active,
                                  :image,
                                  :profile_image
                                  )
  end

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.email == "guest@example.com"
      redirect_to member_path(current_member) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
