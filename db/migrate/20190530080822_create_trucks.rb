class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :number
      t.string :company
      t.string :load_type
      t.string :location

      t.timestamps
    end
  end
end
