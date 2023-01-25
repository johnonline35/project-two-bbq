class RemovePricePerHourFromGrills < ActiveRecord::Migration[5.2]
  def change
    remove_column :grills, :price_per_hour, :decimal
  end
end
