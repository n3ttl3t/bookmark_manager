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
    expect(page).to have_link ('http://www.makersacademy.com')
    expect(page).to have_link ('http://www.google.com')
    expect(page).to have_link ('http://www.destroyallsoftware.com')
  end

end
