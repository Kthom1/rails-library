# frozen_string_literal: true

class AddBookIdToReserveRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :reserve_records, :book, foreign_key: { to_table: :books }
  end
end
