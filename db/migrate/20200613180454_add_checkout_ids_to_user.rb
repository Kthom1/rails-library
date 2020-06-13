# frozen_string_literal: true

class AddCheckoutIdsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :checkout_ids, :bigint, array: true, default: []
  end
end
