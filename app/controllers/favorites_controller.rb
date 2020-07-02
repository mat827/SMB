# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = current_user.favorites.create!(stretch_id: params[:stretch_id])
    flash[:success] = 'この投稿をお気に入りに登録しました'
    @favorite.save
  end

  def destroy
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = Favorite.find(params[:id])
    flash[:danger] = 'この投稿のお気に入りを解除しました'
    if @favorite.destroy
      @favorite = Favorite.find_by(params[:id])
    end
  end
end
