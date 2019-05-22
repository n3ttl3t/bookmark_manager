def clear_database

connection = PG.connect(dbname: 'bookmark_manager_test')
connection.exec('TRUNCATE bookmarks;')

p '...setting up database...'
end
