module Spree
  LineItem.class_eval do
    def sufficient_stock?
      Stock::Quantifier.new(variant, order.internal?).can_supply? quantity
    end
  end
end
