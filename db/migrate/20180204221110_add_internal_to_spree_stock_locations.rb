class AddInternalToSpreeStockLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_stock_locations, :internal, :boolean, default: false
  end
end
