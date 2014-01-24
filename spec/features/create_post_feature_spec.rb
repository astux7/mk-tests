require 'spec_helper'

describe 'Post Creation' do
  it 'should create a Post' do
    visit '/posts/new'
    fill_in 'Title', with: 'Amazing post'
    fill _in 'Content', with: 'This is amazing post content'
    click_button 'Create Post'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Amazing post'
  end
end