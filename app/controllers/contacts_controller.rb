# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i(new show edit)

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to root_path, notice: '質問を送信しました'
    else
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:title,:content, :reply, :user_id ,:email)
  end
end
