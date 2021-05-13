module AmazingStore
  class OrderAnalyzer
    def analyze(order)
      order.update!(rejected: order_rejected?(order))
    end

    private

    def rejected_emails
      ENV.fetch('REJECTED_EMAILS', '').split(',')
    end

    def order_rejected?(order)
      order.email.in?(rejected_emails)
    end
  end
end
