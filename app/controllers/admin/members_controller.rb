class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page]).per(8)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to admin_member_path(member.id), notice: "更新しました。"
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

end
