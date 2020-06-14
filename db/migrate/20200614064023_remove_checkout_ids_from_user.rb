class RemoveCheckoutIdsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :checkout_ids, :bigint
  end
end
