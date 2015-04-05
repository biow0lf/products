require 'rails_helper'

describe 'Create product' do
  context 'degrade mode without javascript'do
    it 'should create product' do
      visit '/'
      click_link 'New Product'
      fill_in 'Name', with: 'Awesome car'
      fill_in 'Description', with: 'Just some awesome car.'
      click_button 'Create Product'
      expect(page).to have_content 'Product was successfully created.'
      expect(page).to have_content 'Awesome car'
      expect(page).to have_content 'Just some awesome car.'
    end

    it 'should show form with filled values and errors' do
      visit '/'
      click_link 'New Product'
      fill_in 'Name', with: 'Ab'
      fill_in 'Description', with: 'Some text'
      click_button 'Create Product'
      expect(page).to have_content 'Name is too short (minimum is 3 characters)'
      expect(page).to have_field('Name', with: 'Ab')
      expect(page).to have_field('Description', with: 'Some text')
    end
  end

  context 'normal mode with javascript', js: true do
    it 'should create product' do
      visit '/'
      click_link 'New Product'
      fill_in 'Name', with: 'Awesome car'
      fill_in 'Description', with: 'Just some awesome car.'
      click_button 'Create Product'
      wait_for_ajax
      expect(page).to have_content('Name: Awesome car')
      expect(page).to have_content('Description: Just some awesome car.')
    end

    it 'should show form with errors' do
      visit '/'
      click_link 'New Product'
      fill_in 'Name', with: 'Ab'
      fill_in 'Description', with: 'Some text'
      click_button 'Create Product'
      wait_for_ajax
      expect(page).to have_content 'Name is too short (minimum is 3 characters)'
      expect(page).to have_field('Name', with: 'Ab')
      expect(page).to have_field('Description', with: 'Some text')
    end
  end
end
