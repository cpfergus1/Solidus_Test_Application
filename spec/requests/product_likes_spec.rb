require 'rails_helper'
require 'spree/api/testing_support/helpers'

RSpec.describe '/api/products/:slug/product_likes', type: :request do
  include Spree::Api::TestingSupport::Helpers
  let(:current_api_user) { create(:user, :with_api_key) }
  before { stub_authentication! }

  describe 'POST /' do

    context 'when the user has not already liked the product' do

      it 'responds with 204 No Content' do
        product = create(:product)

        post spree.api_product_product_like_path(product)

        expect(response.status).to eq(204)
      end

      it 'likes the product' do
        product = create(:product)

        post spree.api_product_product_like_path(product)

        expect(ProductLike.count).to eq(1)
      end
    end

    context 'when the user has already liked the product' do
      it 'responds with 422 Unprocessable Entity' do
        product = create(:product)
        product_like = create(:product_like, user: current_api_user, product: product)

        post spree.api_product_product_like_path(product)

        expect(response.status).to eq(422)
      end

      it 'does not re-like the product' do
        product = create(:product)
        product_like = create(:product_like, user: current_api_user, product: product)

        post spree.api_product_product_like_path(product)

        expect(ProductLike.count).to eq(1)
      end
    end
  end
end
