module Spree
  module Stock
    Coordinator.class_eval do
      private

      def stock_locations_with_internal_if_possible
        order.internal? ? StockLocation.all : StockLocation.not_internal
      end

      def stock_locations_with_requested_variants
        stock_locations_with_internal_if_possible.active.joins(:stock_items).
          where(spree_stock_items: { variant_id: requested_variant_ids }).distinct
      end
    end
  end
end
