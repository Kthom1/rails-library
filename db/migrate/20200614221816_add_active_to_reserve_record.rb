class AddActiveToReserveRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :reserve_records, :active, :boolean
  end
end
