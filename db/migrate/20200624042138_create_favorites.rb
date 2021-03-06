# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :stretch, null: false
      t.integer :position

      t.timestamps
    end
  end
end
