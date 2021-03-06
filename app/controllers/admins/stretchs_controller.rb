# frozen_string_literal: true

class Admins::StretchsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @stretchs = Stretch.page(params[:page]).search(params[:str])

  end

  def new
    @stretch = Stretch.new
    @stretch.stretch_images.build
  end

  def create
    @stretch = Stretch.new(stretch_params)
    if @stretch.save
      redirect_to admins_stretchs_path, notice: 'ストレッチを追加しました'
    else
      flash[:alert] = '入力されていない箇所があります'
      render 'new'
    end
  end

  def show
    @stretch = Stretch.find_by(id:params[:id])
  end

  def edit
    @stretch = Stretch.find_by(id:params[:id])
  end

  def update
    @stretch = Stretch.find(params[:id])
    if @stretch.update(stretch_params)
      redirect_to admins_stretchs_path(@stretch.id)
    else
      render 'edit'
    end
  end

  private

  def stretch_params
    params.require(:stretch).permit(
      :category_id,
      :favorite_id,
      :name,
      :explanation,
      :action_muscles,
      :recommended,
      stretch_images_images: []
    )
  end
end
