class RemoveCategoriesFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :categories, :string
  end
end
