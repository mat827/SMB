# frozen_string_literal: true

class CreateStretches < ActiveRecord::Migration[5.2]
  def change
    create_table :stretches do |t|
      t.timestamps
      t.integer :category_id, foreign_key: true
      t.integer :favorite_id, foreign_key: true
      t.string :name, null: false
      t.string :image_id, null: false
      t.datetime :recommended
      t.text :explanation, null: false
      t.text :action_muscles
    end
  end
end
