class StretchsController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  def index
    @stretchs = Stretch.page(params[:psge]).per(8)
  end

  def show
  end
end
