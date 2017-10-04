class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :inn_id
      t.boolean :is_free, default: true
      t.integer :number
      t.timestamps
    end
  end
end
