module Spree
  module Stock
    Quantifier.class_eval do
      def initialize(variant, internal = true)
        @variant = variant
        @stock_items = @variant.stock_items.with_active_stock_location

        # If the context cannot use internal Stock Locations then
        #   limit stock items to non-internal stock location
        unless internal
          @stock_items = @stock_items.where(spree_stock_locations: { internal: false })
        end
      end
    end
  end
end
