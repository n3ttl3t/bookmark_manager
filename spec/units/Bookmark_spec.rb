require './lib/bookmark'

describe Bookmark do
  it 'shows all bookmarks' do
    expect(Bookmark.all).to eq(['https://www.youtube.com/', 'https://en.wikipedia.org/wiki/Main_Page', 'https://www.facebook.com/'])
  end
end
