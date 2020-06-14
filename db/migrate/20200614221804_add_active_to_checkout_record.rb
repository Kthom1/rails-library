class AddActiveToCheckoutRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :checkout_records, :active, :boolean
  end
end
