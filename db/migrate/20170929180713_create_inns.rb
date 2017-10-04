class CreateInns < ActiveRecord::Migration[5.1]
  def change
    create_table :inns do |t|
      t.string :name
      t.string :image
      t.integer :room_count

      t.timestamps
    end
  end
end
