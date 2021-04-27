RSpec.describe Spree::Product do
  describe '#available?' do
    context 'when MAKE_PRODUCTS_UNAVAILABLE is true' do
      before do
        stub_const 'ENV', ENV.to_h.merge('MAKE_PRODUCTS_UNAVAILABLE' => true)
      end

      it 'makes the product unavailable' do


        product = build_stubbed(:product, available_on: Time.zone.yesterday)
        expect(product).not_to be_available
      end
    end

    context 'when MAKE_PRODUCTS_UNAVAILABLE is false' do
      before do
        allow(ENV).to receive(:[])
          .with('MAKE_PRODUCTS_AVAILABLE')
          .and_return('false')
      end

      it 'makes the product available' do
        product = build_stubbed(:product, available_on: Time.zone.yesterday)

        expect(product).to be_available
      end
    end
  end
end
