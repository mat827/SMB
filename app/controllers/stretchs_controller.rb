class StretchsController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  def index
    @stretchs = Stretch.page(params[:page]).per(8)
    @title = 'ストレッチ'
  end

  def show
    @stretch = Stretch.find(params[:id])
  end
end
