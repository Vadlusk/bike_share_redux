require 'rails_helper'

describe 'Visitor' do
  context 'a visitor goes to the cart page' do
    before(:each) do
      @cart = Cart.new(nil)
      @accessories = create_list(:accessory, 10)
      @accessories.each do |accessory|
        @cart.add_accessory(accessory)
      end
    end
    it 'displays all added accessories' do
      visit '/cart'

      @accessories.each do |accessory|
        expect(page).to have_content(accessory.title)
        expect(page).to have_content(accessory.price)
        expect(page).to have_content(accessory.quantity)
        expect(page).to have_content(accessory.quantity)
      end
      expect(page).to have_content("Total: #{total_price}")
    end
  end
end
