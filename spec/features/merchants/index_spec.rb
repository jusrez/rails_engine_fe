require 'rails_helper'

RSpec.describe 'Merchants Index' do
  describe 'As a visitor, when I visit /merchants' do
    it "I should see a list of merchants by name", :vcr do
      merchants = MerchantFacade.merchants
      
      visit '/merchants'

      within '#merchant-0' do
        expect(page).to have_content(merchants[0].name)  
      end  
      
      within '#merchant-1' do
        expect(page).to have_content(merchants[1].name)
      end

      within '#merchant-2' do
        expect(page).to have_content(merchants[2].name)
      end
    end

    it "when i click the merchant's name I should be on page '/merchants/:id' and I should see a list of items that merchant sells", :vcr do
      merchants = MerchantFacade.merchants
      merchant = MerchantFacade.merchant(1)
      
      visit '/merchants'

      click_link "#{merchant.name}"

      expect(page).to have_content("#{merchant.name}")

    end
  end
end