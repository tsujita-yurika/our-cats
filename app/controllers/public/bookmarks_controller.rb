class Public::BookmarksController < ApplicationController
  before_action :authenticate_member!

  def create
    # Bookmark.newと一緒。newを中間テーブルで書くときはbuild
    @bookmark = current_member.bookmarks.build(request_id: params[:request_id])
    @request = Request.find(params[:request_id])
    @bookmark.save
  end

  def destroy
    # memberのidとrequestのidが入っている
    @bookmark = current_member.bookmarks.find(params[:id])
    # 戻ってこれるようにrequestのidを定義
    request_id = @bookmark.request_id
    @request = Request.find(request_id)
    @bookmark.destroy
  end

  def index
    @bookmarks = current_member.bookmarks.page(params[:page]).per(8)
    @bookmarks_count = @bookmarks.count
  end

end
