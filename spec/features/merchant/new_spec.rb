require 'rails_helper'

RSpec.describe 'New Merchant Creation' do
  describe 'As a Visitor' do
    it 'I can link to a new merchant page from merchant index' do
      visit '/merchants'

      click_link 'New Merchant'

      expect(current_path).to eq('/merchants/new')
    end

    it 'I can use the new merchant form to create a new merchant' do
      visit '/merchants/new'

      name = 'Megans Marmalades'
      address = '123 Main St'
      city = "Denver"
      state = "CO"
      zip = 80218

      fill_in 'Name', with: name
      fill_in 'Address', with: address
      fill_in 'City', with: city
      fill_in 'State', with: state
      fill_in 'Zip', with: zip

      click_button 'Create Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_link(name)

    end

    it 'I get a message if i dont fill out all feilds' do
      visit '/merchants/new'

      name = 'Megans Marmalades'
      address = '123 Main St'
      city = "Denver"
      state = "CO"
      zip = 80218

      fill_in 'Name', with: " "
      fill_in 'Address', with: address
      fill_in 'City', with: city
      fill_in 'State', with: state
      fill_in 'Zip', with: zip
      click_button 'Create Merchant'
      expect(page).to have_content("Name can't be blank")

      visit '/merchants/new'

      fill_in 'Name', with: name
      fill_in 'Address', with: ""
      fill_in 'City', with: city
      fill_in 'State', with: state
      fill_in 'Zip', with: zip
      click_button 'Create Merchant'
      expect(page).to have_content("Address can't be blank")

    visit '/merchants/new'

    fill_in 'Name', with: name
    fill_in 'Address', with: address
    fill_in 'City', with: ""
    fill_in 'State', with: state
    fill_in 'Zip', with: zip
    click_button 'Create Merchant'
    expect(page).to have_content("City can't be blank")

  visit '/merchants/new'

  fill_in 'Name', with: name
  fill_in 'Address', with: address
  fill_in 'City', with: ""
  fill_in 'State', with: state
  fill_in 'Zip', with: zip
  click_button 'Create Merchant'
  expect(page).to have_content("City can't be blank")

  visit '/merchants/new'

  fill_in 'Name', with: name
  fill_in 'Address', with: address
  fill_in 'City', with: city
  fill_in 'State', with: ""
  fill_in 'Zip', with: zip
  click_button 'Create Merchant'
  expect(page).to have_content("State can't be blank")

  visit '/merchants/new'

  fill_in 'Name', with: ""
  fill_in 'Address', with: ""
  fill_in 'City', with: ""
  fill_in 'State', with: ""
  fill_in 'Zip', with: ""
  click_button 'Create Merchant'
  expect(page).to have_content("Name can't be blank, Address can't be blank, City can't be blank, State can't be blank, and Zip can't be blank
")

end
end
end
