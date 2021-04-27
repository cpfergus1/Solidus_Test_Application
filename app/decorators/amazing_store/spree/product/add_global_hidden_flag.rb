module AwesomeStore
  module Spree
    module Product
      module AddGlobalHiddenFlag
        def available?
          ENV['MAKE_PRODUCTS_UNAVAILABLE'] == 'true' && super
        end

        ::Spree::Product.prepend self
      end
    end
  end
end
