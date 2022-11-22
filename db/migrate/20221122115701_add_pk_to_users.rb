class AddPkToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pk, :integer
    add_index :users, :pk
  end
end
