feature 'Add a new bookmark' do

  scenario 'it lets the user add a bookmark' do
    add_single_bookmark
    expect(page).to have_content 'Brown Cardigan'
  end

  scenario 'page links work' do
    add_single_bookmark
    click_link 'Brown Cardigan'
    expect(page).to have_current_path('http://www.browncardigan.com')
  end

end
