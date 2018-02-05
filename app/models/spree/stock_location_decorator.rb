module Spree
  StockLocation.class_eval do
    scope :internal, -> { where(internal: true) }
    scope :not_internal, -> { where.not(internal: true) }
  end
end
