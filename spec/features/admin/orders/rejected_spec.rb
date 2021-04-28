require 'rails_helper'
RSpec.describe 'Order rejected', :js, type: :feature do
  stub_authorization!

  it 'can be removed from rejected' do
    order = create(:completed_order_with_totals, rejected: true)
    visit spree.edit_admin_order_path(order)

    click_button I18n.t('spree.remove_from_rejected')
    order.reload

    expect(order).not_to be_rejected
  end
end
