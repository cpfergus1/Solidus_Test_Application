module AmazingStore
  class NilOrderMerger
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def merge!(other_order, user = nil)
      order.associate_user!(user) if user
    end
  end
end
