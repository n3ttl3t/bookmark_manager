feature 'Update a bookmark' do
  scenario 'there is an update page' do
    visit '/bookmarks'
    click_button 'Update'
    expect(current_path).to eq('/bookmarks/update')
  end

  scenario 'links have update buttons' do
    visit '/bookmarks'
    click_button 'Update'
    expect(page).to have_button('Update link')
  end
  
end
