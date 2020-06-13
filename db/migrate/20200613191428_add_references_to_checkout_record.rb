# frozen_string_literal: true

class AddReferencesToCheckoutRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :checkout_records, :staff, foreign_key: { to_table: :users }
    add_reference :checkout_records, :member, foreign_key: { to_table: :users }
  end
end
