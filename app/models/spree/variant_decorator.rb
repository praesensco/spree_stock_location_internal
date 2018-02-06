module Spree
  Variant.class_eval do
    after_touch :clear_in_stock_external_cache

    def backorderable_external?
      quantifier_external.backorderable?
    end

    def can_supply_external?
      quantifier_external.can_supply?
    end

    def in_stock_external?
      Rails.cache.fetch(in_stock_external_cache_key) do
        total_on_hand_external > 0
      end
    end

    def total_on_hand_external
      quantifier_external.total_on_hand
    end

    private

    def clear_in_stock_external_cache
      Rails.cache.delete(in_stock_external_cache_key)
    end

    def in_stock_external_cache_key
      "variant-#{id}-in_stock_external"
    end

    def quantifier_external
      Spree::Stock::Quantifier.new(self, false)
    end
  end
end
