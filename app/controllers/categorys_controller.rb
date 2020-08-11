# frozen_string_literal: true

class CategorysController < ApplicationController
  before_action :authenticate_user!

  def search
    @categorys = Category.where(is_valid: true)
    @category = Category.find(params[:id])
    @q = @category.stretchs.all.ransack(params[:q])
    @stretchs = @q.result(distinct: true).page(params[:page])
    @title = @category.name
    render 'stretchs/index'
  end
end
