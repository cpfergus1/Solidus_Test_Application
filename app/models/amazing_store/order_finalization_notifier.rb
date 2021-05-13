module AmazingStore
  class OrderFinalizationNotifier
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def run
      'made it'
    end

    private

    def order
      event.payload[:order]
    end
  end
end
