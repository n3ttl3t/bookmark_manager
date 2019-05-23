require 'pg'

class Bookmark
attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = con.exec( 'SELECT * FROM bookmarks;' )
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add_to_database(url, title)
    con.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')");
  end

private

  def self.con
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

end
