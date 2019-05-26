require 'sinatra/base'
require './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
  enable :sessions
  enable :method_override

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

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :delete
  end

  delete '/bookmarks/:id' do
    Bookmark.delete_from_database(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    @bookmarks = Bookmark.all
    erb :update
  end



end
