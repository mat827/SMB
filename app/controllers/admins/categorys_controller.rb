# frozen_string_literal: true

class Admins::CategorysController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categorys = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categorys_path, notice: 'カテゴリを追加しました'
    else
      flash[:alert] = '入力されていない箇所があります'
      @categorys = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admins_categorys_path, notice: 'カテゴリを修正しました'
    else
      flash[:alert] = '入力されていない箇所があります'
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :is_valid)
  end
end
