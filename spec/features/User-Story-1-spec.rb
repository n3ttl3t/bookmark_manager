feature 'view bookmarks' do

  scenario '/test' do
    visit '/test'
    expect(page).to have_content('maaate')
  end

  scenario 'page has links' do
    visit '/'
    expect(page).to have_link ('https://devhints.io/capybara')
  end

end
