require 'sinatra/base'

class Bookmarks < Sinatra::Base

  get '/test' do
    "Testing infrastructure maaate"
  end

  get '/' do
    erb :index
  end

end
