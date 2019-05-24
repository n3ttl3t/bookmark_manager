feature 'can delete bookmarks' do

  scenario 'there is a delete page' do
    visit '/bookmarks'
    expect(page).to have_button 'Delete'
  end

  scenario 'links have delete buttons' do
    add_single_bookmark
    click_button('Delete')
    expect(page).to have_button('Delete link')
  end

  scenario 'deletes a bookmark' do
    add_single_bookmark
    click_button('Delete')
    click_button('Delete link')
    save_and_open_page
    expect(page).not_to have_link('Brown Cardigan')
  end

end
