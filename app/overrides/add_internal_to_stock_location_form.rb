Deface::Override.new(
  virtual_path: 'spree/admin/stock_locations/_form',
  insert_bottom: '[data-hook="stock_location_status"]',
  name: 'add_internal_to_stock_location_form',
  partial: 'spree/admin/stock_locations/form_internal'
)
