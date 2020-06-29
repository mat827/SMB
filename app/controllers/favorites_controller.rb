# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create!(stretch_id: params[:stretch_id])
    flash[:success] = 'この投稿をお気に入りに登録しました'
    redirect_to stretch_path(favorite.stretch.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = 'この投稿のお気に入りを解除しました'
    redirect_to stretch_path(favorite.stretch.id)
  end
end
