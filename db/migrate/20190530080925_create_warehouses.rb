class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :company
      t.integer :capacity

      t.timestamps
    end
  end
end
