class StretchsController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  def index
    # is_validがマッチするレコードを全て取得
    @categorys = Category.where(is_valid: true)
    @stretchs = Stretch.page(params[:page]).per(8)
    @title = 'ストレッチ'
  end

  def show
    @categorys = Category.where(is_valid: true)
    @stretch = Stretch.find(params[:id])
  end
end
