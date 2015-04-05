require 'rails_helper'

describe 'Delete product' do
  before(:each) do
    create(:product,
           name: 'Awesome car',
           description: 'Just some car.'
    )
  end

  context 'degrade mode without javascript'do
    it 'should delete product' do
      visit '/'

      expect(page).to have_content('Awesome car')
      expect(page).to have_content('Just some car.')
      click_link 'Destroy'
      expect(page).to have_content('Are you sure you want to delete this record?')
      click_button 'Destroy'
      expect(page).to have_content('Product was successfully destroyed.')
    end
  end

  context 'normal mode with javascript', js: true do
    it 'should delete product' do
      visit '/'

      expect(page).to have_content('Awesome car')
      expect(page).to have_content('Just some car.')
      click_link 'Destroy'
      page.driver.browser.switch_to.alert.accept
      wait_for_ajax
      expect(page).not_to have_content 'Awesome car'
      expect(page).not_to have_content('Just some car.')
    end
  end
end
