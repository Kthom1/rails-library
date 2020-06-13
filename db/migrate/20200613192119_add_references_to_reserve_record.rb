# frozen_string_literal: true

class AddReferencesToReserveRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :reserve_records, :staff, foreign_key: { to_table: :users }
    add_reference :reserve_records, :member, foreign_key: { to_table: :users }
  end
end
