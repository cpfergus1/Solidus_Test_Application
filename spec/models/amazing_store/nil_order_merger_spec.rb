require 'rails_helper'
#spec/models/awesome_store/nil_order_merger_spec.rb
RSpec.describe AmazingStore::NilOrderMerger do
  subject(:order_merger) { described_class.new(order) }
  let(:order) { instance_spy('Spree::Order') }
  context 'when a user is provided' do
    it 'associates the order to the user' do
      other_order = instance_spy('Spree::Order')
      user = double
      subject.merge!(other_order, user)
      expect(order).to have_received(:associate_user!).with(user)
    end
  end
  context 'when a user is not provided' do
    it 'does not attempt to associate the order to the user' do
      other_order = instance_spy('Spree::Order')
      user=nil
      subject.merge!(other_order, user)
      expect(order).not_to have_received(:associate_user!)
    end
  end
end
