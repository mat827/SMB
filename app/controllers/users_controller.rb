# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @reviews = Review.includes(:user, :stretch).where(user_id: @user.id).page(params[:page])
    @favorite = Favorite.where('user_id = ?', @user)
    @favorites = @user.favorites.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '登録情報を変更しました'
    else
      flash[:alert] = '入力されていない箇所があります'
      render 'edit'
    end
  end

  def edit_withdraw
    @user = current_user
  end

  def withdraw
    user = current_user
    user.update!(is_valid: '無効')
    reset_session # 情報をリセット
    redirect_to root_path, notice: '退会しました'
  end

  def sort
    @user = current_user
    # favorite = @user.favorites(params[:from].to_i)
    favorite = @user.favorites.find_by(position: params[:from].to_i + 1)
    favorite.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def user_params
    params.require(:user).permit(
      :family_name,
      :first_name,
      :family_name_yomi,
      :first_name_yomi,
      :phone_number,
      :is_valid
    )
  end
end
