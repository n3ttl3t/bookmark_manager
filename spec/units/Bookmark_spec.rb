require './lib/bookmark'

describe Bookmark do

  it 'shows all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add_to_database('http://www.google.com',"Google")
    Bookmark.add_to_database('http://www.browncardigan.com', 'Brown Cardigan')

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 2
    expect(bookmarks.first).to be_a(Bookmark)
    expect(bookmarks.first.url).to eq('http://www.google.com')
    expect(bookmarks.last.title).to eq 'Brown Cardigan'
  end

  it 'adds a bookmark' do
    Bookmark.add_to_database('www.browncardigan.com',"Brown Cardigan")
    expect(Bookmark.all.first.url).to include('www.browncardigan.com')
  end

end
