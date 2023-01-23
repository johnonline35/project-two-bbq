class AddPricePerHourToGrills < ActiveRecord::Migration[5.2]
  def change
    add_column :grills, :price_per_hour, :numeric
  end
end
