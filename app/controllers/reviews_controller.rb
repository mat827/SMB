# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @review = Review.find(params[:id])
  end

  def create
    @categorys = Category.where(is_valid: true)
    @stretch = Stretch.find(params[:review][:stretch_id])
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to stretchs_path, notice: '口コミを登録しました'
    else
      flash[:alert] = '既に投稿されています'
      render 'stretchs/show'
    end
  end

  def destroy
    review = current_user.reviews.find_by(id: params[:id]).destroy
    redirect_to stretch_path(review.stretch.id), notice: '口コミを削除しました'
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if Review.update(review_params)
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def index
    @reviews = Review.includes(:user, :stretch).order(created_at: :desc).page(params[:page])
  end

  private

  def review_params
    params.require(:review).permit(:title, :rate, :content, :picture, :stretch_id)
  end
end
