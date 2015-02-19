require 'rails_helper'

feature 'reviewing' do

  before {Restaurant.create name: 'KFC'}

  scenario 'user cannot leave a review if not logged in' do 
    visit '/restaurants'
    expect(page).not_to have_link('Review')
  end

  context 'user logged in' do

    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'allows user to leave a review using a form' do 
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'
  
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content('so so')
    end

    scenario 'user cannot review his worst restaurant twice' do
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'

      click_link 'Review KFC'
      fill_in "Thoughts", with: "no, this is bad"
      select '1', from: 'Rating'
      click_button 'Leave Review'
      expect(page).not_to have_content('no, this is bad')
    end

    scenario 'user can delete his review' do 
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'

      click_link 'Delete Review'
      expect(page).not_to have_content('so so')
    end

    scenario 'user cannot delete someones review' do 
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select '3', from: 'Rating'
      click_button 'Leave Review'  

      click_link 'Sign out'
      click_link('Sign up')
      fill_in('Email', with: 'test2@example.com')
      fill_in('Password', with: 'testtest2')
      fill_in('Password confirmation', with: 'testtest2')
      click_button('Sign up')

      expect(page).not_to have_link('Delete Review')
    end

  end

  context "Make review looks better" do
    scenario "displays an average rating for all reviews" do
      sign_in('Hoe')
      leave_review("So so", '3')

      click_link 'Sign out'
      sign_in('Pot')
      leave_review("Great", '5')
      expect(page).to have_content('Average rating: 4 ★★★★☆')
    end
  end
end

def sign_in(name)
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: name + '@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def leave_review(thougths, rating)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thougths
  select rating, from: 'Rating'
  click_button 'Leave Review'
end