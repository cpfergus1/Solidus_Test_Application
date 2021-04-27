module AmazingStore
  module Spree
    module Product
      module AddGlobalHiddenFlagDecorator
        def available?
          ENV['MAKE_PRODUCTS_UNAVAILABLE'] == false && super
        end

        ::Spree::Product.prepend self
      end
    end
  end
end
