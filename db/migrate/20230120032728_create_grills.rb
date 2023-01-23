class CreateGrills < ActiveRecord::Migration[5.2]
  def change
    create_table :grills do |t|
      t.text :name
      t.text :location
      t.integer :user_id

      t.timestamps
    end
  end
end
