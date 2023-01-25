class AddPricePerDayToGrills < ActiveRecord::Migration[5.2]
  def change
    add_column :grills, :price_per_day, :decimal
  end
end
