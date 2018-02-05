module Spree
  CheckoutController.class_eval do
    before_action :unset_internal_flag, only: [:update]

    def unset_internal_flag
      @order.update(internal: false) if @order.internal?
    end
  end
end
