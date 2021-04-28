require 'rails_helper'
require 'amazing_store/order_analyzer'

RSpec.describe Spree::Order do
  describe '#finalize!' do
    before do
    stub_const 'ENV',
        ENV.to_h
        .merge('REJECTED_EMAILS' => 'jdoe@example.com')
    end

    context 'when the email has been rejected' do
      it 'marks the order as rejected' do
        order = create(:order_ready_to_complete)
        order.update(email: 'jdoe@example.com')
        order.finalize!

        expect(order).to be_rejected
      end
    end

    context 'when the email has not been rejected' do
      it 'does not mark the order as rejected' do
        order = create(:order_ready_to_complete)
        order.update(email: 'hello@example.com')
        order.finalize!

        expect(order).not_to be_rejected
      end
    end
  end
end
