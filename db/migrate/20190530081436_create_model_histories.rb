class CreateModelHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :model_histories do |t|
      t.integer :record_id
      t.string :model
      t.text :serialized_obj
      t.string :action
      t.integer :actor_id
      t.timestamp :action_time

      t.timestamps
    end
  end
end
