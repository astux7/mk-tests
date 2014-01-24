require 'spec_helper'

describe 'Editing and Deleting Post' do
  describe 'Editing posts' do 
    it 'should edit the post with new title ' do
      create(:post)
      visit '/posts'
      click_link 'Edit'
      fill_in 'Title', with: 'New Title'
      fill_in 'Content', with: 'New Content'
      click_button 'Update Post'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'New Title'
      expect(page).to have_content 'New Content'
    end
    
  end
  describe 'Deleting posts' do 
    it 'should delete the post with new title ' do
      create(:post)
      visit '/posts'
      click_link 'Delete'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'No Posts yet!'
     end
  end
end