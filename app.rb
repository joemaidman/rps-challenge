require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class RockPaperScissors < Sinatra::Base

  set :sessions, true

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(Player.new(params[:name_player_one]), Player.new(params[:name_player_two]))
    redirect '/play'
  end

  get '/play' do
    @game.change_player
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
