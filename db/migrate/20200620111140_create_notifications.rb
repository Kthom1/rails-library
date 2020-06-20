# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :member, index: true, foreign_key: { to_table: :users }
      t.string :message
      t.timestamps
    end
  end
end
