class CreateStretches < ActiveRecord::Migration[5.2]
  def change
    create_table :stretches do |t|

      t.timestamps
      t.integer :category_id, foreign_key: true
      t.integer :favorite_id, foreign_key: true
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :explanation, null: false
    end
  end
end
