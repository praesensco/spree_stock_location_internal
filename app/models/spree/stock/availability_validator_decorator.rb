module Spree
  module Stock
    AvailabilityValidator.class_eval do
      private

      def item_available?(line_item, quantity)
        Stock::Quantifier.new(line_item.variant, line_item.order.internal?).can_supply?(quantity)
      end
    end
  end
end
