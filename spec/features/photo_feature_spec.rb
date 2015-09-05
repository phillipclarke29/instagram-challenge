require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a propmt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos added!'
      expect(page). to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'sunset.jpg')
  end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('sunset.jpg')
      expect(page).not_to have_content('No photos added')
    end
  end

  context 'adding photos' do
    scenario 'prompts the user to fill out a field, then displays the photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Title', with: 'sunset.jpg'
      click_button 'Create Photo'
      expect(page).to have_content 'sunset.jpg'
      expect(current_path).to eq '/photos'
    end
  end
end