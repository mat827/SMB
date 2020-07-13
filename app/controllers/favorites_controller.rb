# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = current_user.favorites.create!(stretch_id: params[:stretch_id])
    @favorite.save
  end

  def destroy
    @stretch = Stretch.find(params[:stretch_id])
    @favorite = Favorite.find(params[:id])
    @favorite = nil if @favorite.destroy
  end
end
