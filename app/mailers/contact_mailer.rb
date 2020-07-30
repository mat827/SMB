# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: "smb.stretch50@gmail.com"

  # お問い合わせ送信
  def send_when_admin_reply(user, contact) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = contact.reply #返信内容
    mail to: user.email, subject: '【SMB】 お問い合わせありがとうございます'
  end
end
