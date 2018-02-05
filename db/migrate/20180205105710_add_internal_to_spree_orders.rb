class AddInternalToSpreeOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_orders, :internal, :boolean, default: true
  end
end
