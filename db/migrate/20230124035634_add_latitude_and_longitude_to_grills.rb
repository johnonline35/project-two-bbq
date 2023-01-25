class AddLatitudeAndLongitudeToGrills < ActiveRecord::Migration[5.2]
  def change
    add_column :grills, :latitude, :float
    add_column :grills, :longitude, :float
  end
end
