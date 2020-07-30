# frozen_string_literal: true

class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contacts = Contact.all
    @users = User.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admins_contacts_path, notice: '質問を削除しました'
  end

  def update
    contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
    user = User.find(contact.user_id)
    contact.update(contact_params)
    ContactMailer.send_when_admin_reply(user, contact).deliver_now #確認メールを送信

    redirect_to admins_contacts_path
  end

   private
    def contact_params
        params.require(:contact).permit(:title, :content, :reply, :user_id ,:email)
    end
end