# frozen_string_literal: true

class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admins_contacts_path, notice: '質問を削除しました'
  end
end
