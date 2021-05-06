module AmazingStore
  module Spree
    module Admin
      module OrdersController
        module AddRemoveFromRejectedAction
          def remove_from_rejected
            load_order

            @order.update!(rejected: false)

            redirect_to edit_admin_order_path(@order)
          end

          ::Spree::Admin::OrdersController.prepend self
        end
      end
    end
  end
end
