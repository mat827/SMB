# frozen_string_literal: true

class Admins::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    case params[:category]
    when 'stretchs'
      redirect_to admins_stretchs_path(str: params[:str])
    when 'users'
      redirect_to admins_users_path(str: params[:str])
    end
  end
end
