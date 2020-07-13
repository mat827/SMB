# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i(new show edit)

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to stretchs_path, notice: '質問を送信しました'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
