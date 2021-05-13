require 'rails_helper'

RSpec.describe AmazingStore::OrderFinalizationNotifier do
  it 'calls the external API' do
    order = double('Spree::Order')
    event = double('Spree::Event', payload: { order: order })

    expect(described_class.new(event).run).to be_a(String)


  end
end
