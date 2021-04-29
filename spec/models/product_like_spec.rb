require 'rails_helper'

RSpec.describe ProductLike do
  it 'has a valid factory' do
    expect(build(:product_like)).to be_valid
  end

  it 'validates the uniqueness of the user/product pair' do
    existing_product_like = create(:product_like)

    product_like = build(:product_like,
      user: existing_product_like.user,
      product: existing_product_like.product,
    )

    expect(product_like).not_to be_valid
  end
end
