# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = Review.includes(:user, :stretch).all.order(created_at: :desc).limit(3)
  end
end
