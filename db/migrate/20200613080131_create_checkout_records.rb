# frozen_string_literal: true

class CreateCheckoutRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :checkout_records do |t|
      t.datetime :checkout_date
      t.datetime :supposed_return_date
      t.datetime :actual_return_date
      t.timestamps
    end
  end
end
