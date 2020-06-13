# frozen_string_literal: true

class AddReserveIdsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reserve_ids, :bigint, array: true, default: []
  end
end
