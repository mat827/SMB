# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string 'title'
      t.text 'content'
      t.string 'picture'
      t.float 'rate'
      t.integer 'user_id'
      t.integer 'stretch_id'

      t.timestamps
    end
  end
end
