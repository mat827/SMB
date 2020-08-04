class CreateStretchImages < ActiveRecord::Migration[5.2]
  def change
    create_table :stretch_images do |t|
      t.integer :stretch_id
      t.string :image_id

      t.timestamps
    end
  end
end
