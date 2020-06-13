# frozen_string_literal: true

class CreateReserveRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :reserve_records do |t|
      t.datetime :valid_until_date
      t.timestamps
    end
  end
end
