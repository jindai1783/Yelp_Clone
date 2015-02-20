require 'rails_helper'

feature 'endorsing reviews' do 

  before do 
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3,thoughts: 'It was and abomination')
  end

  # scenario 'a user can endorse a review,which updates the review ednorsment count' do 
  #   visit '/restaurants'
  #   click_link 'Endorse Review'
  #   expect(page).to have_content('1 endorsements')
  # end

    it 'a user can endorse a review, which increments in the endorsement count', js: true do
      visit '/restaurants'
      click_link 'Endorse Review'
      expect(page).to have_content("1 endorsements")
    end

end