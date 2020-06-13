# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.boolean :checked_out
      t.boolean :reserved
      t.string :categories, array: true, default: []
      t.timestamps
    end
  end
end
