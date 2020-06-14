# frozen_string_literal: true

class AddBookIdToCheckoutRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :checkout_records, :book, foreign_key: { to_table: :books }
  end
end
