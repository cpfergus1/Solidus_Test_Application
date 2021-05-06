require 'rails_helper'
require 'amazing_store/order_finalization_notifier.rb'
RSpec.describe AmazingStore::OrderFinalizationNotifier do
  it 'calls the external API' do
    order = double('Spree::Order')
    event = double('Spree::Event', payload: { order: order })

    expect(described_class.new(event).run).to be_a(String)


  end
end
