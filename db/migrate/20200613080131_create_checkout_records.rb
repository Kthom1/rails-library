class CreateCheckoutRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :checkout_records do |t|
      
      t.timestamps
    end
  end
end
