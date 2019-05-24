
def add_single_bookmark
  visit('/bookmarks')
  click_button ('Add')
  save_and_open_page
  fill_in 'url', with: 'http://www.browncardigan.com'
  fill_in 'title', with: 'Brown Cardigan'
  click_button 'Submit'
end
