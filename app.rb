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

  get '/bookmarks/add' do
    erb :add
  end

  post '/bookmarks/add' do
    Bookmark.add_to_database(params[:url],params[:title])
    redirect '/bookmarks'
  end

end
