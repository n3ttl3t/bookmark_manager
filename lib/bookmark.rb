require 'pg'

class Bookmark

  def self.all
    connection = set_database
    result = connection.exec( 'SELECT * FROM bookmarks;' )
    result.map { |bookmark| bookmark['url']}
  end

  def self.set_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

end
