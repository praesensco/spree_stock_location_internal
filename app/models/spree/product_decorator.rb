module Spree
  Product.class_eval do
    def can_supply_external?
      variants_including_master.any?(&:can_supply_external?)
    end
  end
end
