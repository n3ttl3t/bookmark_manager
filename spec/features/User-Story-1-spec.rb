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
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('DestroyAllSoftware', 'http://www.destroyallsoftware.com');")
    visit '/bookmarks'
    expect(page).to have_link ('Makers')
    expect(page).to have_link ('Google')
    expect(page).to have_link ('DestroyAllSoftware')
  end

end
