module Spree
  Variant.class_eval do
    def total_on_hand_external
      quantifier_external.total_on_hand
    end

    def can_supply_external?
      quantifier_external.can_supply?
    end

    def backorderable_external?
      quantifier_external.backorderable?
    end

    private

    def quantifier_external
      Spree::Stock::Quantifier.new(self, false)
    end
  end
end
