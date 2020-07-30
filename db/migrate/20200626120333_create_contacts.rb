# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :title
      t.text :content
      t.integer :reply
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end
