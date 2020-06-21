class CategorysController < ApplicationController
  before_action :authenticate_user!

  def search
    @categorys = Category.where(is_valid: true)
    @category = Category.find(params[:id])
    @stretchs = @category.stretchs.all.page(params[:page]).per(8)
    @title = @category.name
    render 'stretchs/index'
  end

end

# find＝主キーに対応するレコードを取り出す
# find＿by＝与えられた条件にマッチするレコードのうち最初のレコードだけを返す。
# find＿where＝与えられた条件にマッチするレコードを全て返す
