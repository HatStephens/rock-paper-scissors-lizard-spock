require 'sinatra/base'
require 'sinatra/flash'
require 'securerandom'
require_relative 'game'
require_relative 'player'
require_relative 'enemy'
require_relative 'weapon'


class RPSLS < Sinatra::Base

	set :views, Proc.new {File.join(root, '..', 'views')}
	set :public_folder, 'public'

	enable :sessions

	# GAME = Game.new

	@@games = Hash.new
	@@waiting_player = []

	get '/' do
		if @@waiting_player.empty?
			session[:id] = SecureRandom.uuid
			@@waiting_player << session[:id]
			@@games[session[:id]] = Game.new
		else
			session[:id] = SecureRandom.uuid
			@@games[session[:id]] = @@games[@@waiting_player.pop]
		end

	  erb :index
	end

	post '/create_player' do
		# flash[:error] = "You need to pass a name numnuts! Try again please."
		# redirect '/' if params['name']==""
	  	@name = params['name']
	  	session[:name] = @name
	 
		erb :index
	end

	post '/opponent_route' do
		redirect '/opponent_computer' if params['opponent']=="super_computer"
		redirect '/opponent_human'
	end

	get '/opponent_computer' do
		player = Player.new
	  	player.name = session[:name]
	  	@@games[session[:id]].add_player(player)
		enemy = Enemy.new
		@@games[session[:id]].add_player(enemy)
		redirect '/choose_weapon'
	end


	get '/opponent_human' do
		player = Player.new
	  	player.name = session[:name]
	  	@@games[session[:id]].add_player(player)
	  	if @@games[session[:id]].has_two_players?
	  		session[:player] = :player2
	  	else
	  		session[:player] = :player1
	  	end
		redirect '/waiting_for_player' if !@@games[session[:id]].has_two_players?
		redirect '/choose_weapon'
	end

	get '/choose_weapon' do
		@opponent = @@games[session[:id]].player2.name if @@games[session[:id]].player2.is_a?(Enemy)
		@name = session[:name]

		erb :game_screen
	end

	get '/waiting_for_player' do
		redirect '/choose_weapon' if @@games[session[:id]].has_two_players?
		@name = session[:name]

		erb :waiting
	end

	post '/weapon_vs_computer' do
		@@games[session[:id]].player1.weapon = params['weapon']
		@@games[session[:id]].get_computer_weapon

		erb :result
	end

	post '/weapon_vs_human' do
		if session[:player]==:player1
			@@games[session[:id]].player1.weapon = params['weapon']
		else
			@@games[session[:id]].player2.weapon = params['weapon']
		end

		redirect '/waiting_for_weapon' unless @@games[session[:id]].both_have_weapon?

		redirect '/result_vs_human'
	end

	get '/waiting_for_weapon' do
		redirect '/result_vs_human' if @@games[session[:id]].both_have_weapon?
		@name = session[:name]

		erb :waiting
	end

	get '/result_vs_human' do

		erb :result
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
