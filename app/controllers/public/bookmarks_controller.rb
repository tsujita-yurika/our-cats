class Public::BookmarksController < ApplicationController
  before_action :authenticate_member!

  def create
    # Bookmark.newと一緒。newを中間テーブルで書くときはbuild
    @bookmark = current_member.bookmarks.build(request_id: params[:request_id])
    @request = Request.find(params[:request_id])
    if @bookmark.save
      flash[:notice] = "ブックマークしました。"
    else
      flash[:error] = "ブックマークできませんでした。"
    end
    # redirect_to request_path(params[:request_id])
  end

  def destroy
    # memberのidとrequestのidが入っている
    @bookmark = current_member.bookmarks.find(params[:id])
    # 戻ってこれるようにrequestのidを定義
    request_id = @bookmark.request_id
    @request = Request.find(request_id)
    if @bookmark.destroy
      flash[:notice] = "ブックマークを解除しました。"
    else
      flash[:error] = "ブックマークを解除できませんでした。"
    end
    # redirect_to request_path(request_id)
  end

  def index
    @bookmarks = current_member.bookmarks.page(params[:page]).per(8)
    @bookmarks_count = Bookmark.count
  end

end
