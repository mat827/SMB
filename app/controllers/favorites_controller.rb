# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = current_user.favorites.create!(stretch_id: params[:stretch_id])
    @favorite.save
  end

  def destroy
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      @favorite = nil
    end
  end
end
