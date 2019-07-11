require 'rails_helper'

RSpec.describe 'Update Review ' do
  describe 'As a Visitor' do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @hippo = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      @review_1 = @hippo.reviews.create!(title: 'Good Hippo', content: "The Hippo was good", rating: 4 )
    end

    it 'I can click a link to get to an item edit page' do
      visit "/items/#{@hippo.id}"

      click_link 'Edit Review'

      expect(current_path).to eq("/items/#{@hippo.id}/reviews/#{@review_1.id}/edit")
    end

    it 'I can edit the items information' do
      title = 'Good'
      content = "It was good!"
      rating = 5


      visit "items/#{@hippo.id}/reviews/#{@review_1.id}/edit"

      fill_in 'Title', with: title
      fill_in 'content', with: content
      fill_in 'rating', with: rating

      click_button 'Update Review'

      expect(current_path).to eq("/items/#{@hippo.id}")
      expect(page).to have_content(title)
      expect(page).to have_content(content)
      expect(page).to have_content(rating)
    end
  end
end
