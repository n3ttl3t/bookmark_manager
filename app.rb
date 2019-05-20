require 'sinatra/base'
require './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
  enable :sessions

  get '/test' do
    "Testing infrastructure maaate"
  end

  get '/' do
    session[:bookmark] = Bookmark.new
    erb :index
  end

  get '/bookmarks' do
    session[:bookmark] = Bookmark.new
    @bookmark = session[:bookmark]
    erb :bookmarks
  end

end
