require 'rails_helper'

describe 'Update product' do
  context 'degrade mode without javascript' do
    it 'should update product' do
      create(:product,
             name: 'Awesome car',
             description: 'Just awesome car')

      visit '/'
      click_link 'Edit'
      fill_in 'Name', with: 'Car'
      fill_in 'Description', with: 'Just car'
      click_button 'Update Product'
      expect(page).to have_content('Product was successfully updated.')
      expect(page).to have_content('Name: Car')
      expect(page).to have_content('Description: Just car')
    end

    it 'should show form with values and errors' do
      create(:product,
             name: 'Awesome car',
             description: 'Just awesome car')

      visit '/'
      click_link 'Edit'
      fill_in 'Name', with: 'Ab'
      fill_in 'Description', with: 'Just car'
      click_button 'Update Product'
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_field('Name', with: 'Ab')
      expect(page).to have_field('Description', with: 'Just car')
    end
  end

  context 'normal mode with javascript', js: true do
    it 'should update product' do
      create(:product,
             name: 'Awesome car',
             description: 'Just awesome car')

      visit '/'
      click_link 'Edit'
      fill_in 'Name', with: 'Car'
      fill_in 'Description', with: 'Just car'
      click_button 'Update Product'
      expect(page).to have_content('Name: Car')
      expect(page).to have_content('Description: Just car')
    end

    it 'should show form with values and errors' do
      create(:product,
             name: 'Awesome car',
             description: 'Just awesome car')

      visit '/'
      click_link 'Edit'
      fill_in 'Name', with: 'Ab'
      fill_in 'Description', with: 'Just car'
      click_button 'Update Product'
      expect(page).to have_content('Name is too short (minimum is 3 characters)')
      expect(page).to have_field('Name', with: 'Ab')
      expect(page).to have_field('Description', with: 'Just car')
    end
  end
end
