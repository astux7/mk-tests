require 'spec_helper'

describe 'Viewing Post' do

  it 'should see the msg if no posts' do
    visit '/posts'
   # raise page.html
    expect(page).to have_content 'No Posts yet!'
  end
  
  it 'should see the msg if no posts' do
    create(:post)
    visit '/posts'
    expect(page).to have_content 'MyString'
  end  

end