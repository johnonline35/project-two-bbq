class AddImageToGrills < ActiveRecord::Migration[5.2]
  def change
    add_column :grills, :image, :text
  end
end
