require 'sinatra/base'
require './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
  enable :sessions

  get '/test' do
    "Testing infrastructure maaate"
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

end
