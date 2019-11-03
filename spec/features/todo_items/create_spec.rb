require 'rails_helper'

describe 'Creating todo items' do

  it 'redirects to the todo items index page on success' do
    visit '/todo_items'
    click_link 'Add new item'
    expect(page).to have_content('New item')
  end
end
