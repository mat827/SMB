# frozen_string_literal: true

class StretchsController < ApplicationController
  before_action :authenticate_user!
  def index
    # is_validがマッチするレコードを全て取得
    @categorys = Category.where(is_valid: true)
    @q = Stretch.all.ransack(params[:q])
    @stretchs = @q.result(distinct: true).page(params[:page]).per(4)
    @title = 'ストレッチ'
  end

  def show
    @review = Review.new
    @categorys = Category.where(is_valid: true)
    @stretch = Stretch.find(params[:id])
    @reviews = Review.where(stretch_id: @stretch.id).page(params[:page])
    @favorite = current_user.favorites.find_by(stretch_id: @stretch.id)
    @favorites = @stretch.favorite_users
  end

end
