class Public::HomesController < ApplicationController

  def top
    @recent_cats = Cat.order(created_at: :desc).limit(4)
  end

  def about
  end
end
