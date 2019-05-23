
def add_single_bookmark
  visit('/bookmarks')
  fill_in 'url', with: 'http://www.browncardigan.com'
  fill_in 'title', with: 'Brown Cardigan'
  click_button 'Submit'
end
