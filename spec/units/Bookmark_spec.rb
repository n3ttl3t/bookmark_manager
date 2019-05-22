require './lib/bookmark'

describe Bookmark do
  it 'shows all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    expect(Bookmark.all).to eq(['http://www.makersacademy.com', 'http://www.google.com', 'http://www.destroyallsoftware.com'])
  end
end
