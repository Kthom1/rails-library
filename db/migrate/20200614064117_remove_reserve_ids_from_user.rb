class RemoveReserveIdsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :reserve_ids, :bigint
  end
end
