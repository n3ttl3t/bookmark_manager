feature 'view bookmarks' do

  scenario '/test' do
    visit '/test'
    expect(page).to have_content('maaate')
  end

  scenario '/' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'page has links' do
    visit '/bookmarks'
    expect(page).to have_link ('https://www.youtube.com/')
  end

end
