require 'spec_helper'

describe 'Post Creation' do
  it 'should create a Post' do
    visit '/posts/new'
   # raise page.html
    fill_in 'post[title]', with: 'Amazing post'
    fill_in 'post[content]', with: 'This is amazing post content'
    click_button 'Create Post'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Amazing post'
  end
end