# frozen_string_literal: true

class StretchsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    # is_validがマッチするレコードを全て取得
    @categorys = Category.where(is_valid: true)
    @q = Stretch.all.ransack(params[:q])
    @stretchs = @q.result(distinct: true).page(params[:page]).per(8)
    @title = 'ストレッチ'
  end

  def show
    @review = Review.new
    @reviews = Review.includes(:user, :stretch).where('stretch_id = ?', @stretch).page(params[:page])
    @categorys = Category.where(is_valid: true)
    @stretch = Stretch.find(params[:id])
    @favorite = current_user.favorites.find_by(stretch_id: @stretch.id)
    @favorites = @stretch.favorite_users
  end
end
