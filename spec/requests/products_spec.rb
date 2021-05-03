require 'rails_helper'
require 'spree/api/testing_support/helpers'

RSpec.describe '/api/products', type: :request do
  include Spree::Api::TestingSupport::Helpers
  let(:current_api_user) { create(:user, :with_api_key) }
  before { stub_authentication! }

  describe 'GET /:slug' do
    it 'exposes the likes_count field' do
      product = create(:product)
      get spree.api_product_path(product)

      parsed_response = JSON.parse(response.body)
      byebug
      expect(parsed_response).to match(a_hash_including(
        'product' => a_hash_including('likes_count' => 0),
      ))
    end
  end
end
