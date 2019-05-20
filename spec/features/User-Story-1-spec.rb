feature 'view bookmarks' do

  scenario '/test' do
    visit '/test'
    save_and_open_page

    expect(page).to have_content('maaate')
  end

end
