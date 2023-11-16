class Public::MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
    @cats = @member.cats
    @cat = Cat.new
    @requests = @member.requests
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

end
