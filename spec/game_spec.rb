require 'game'

describe Game do

	let(:game){Game.new}

	it 'should initialize with a Player 1' do
		expect(game.player1).to eq nil
	end

	it 'should initialize with a Player 2' do
		expect(game.player2).to eq nil
	end

	it 'should be able to assign a player' do
		expect{game.add_player(:player)}.to change{game.player1.nil?}.to be false
	end

	it 'should be able to know when it has two player' do
		2.times{game.add_player(:player)}
		expect(game.has_two_players?).to be true
	end

	it 'should know when the second player is the computer' do
		enemy = double :enemy
		allow(enemy).to receive(:is_a?).and_return(true)
		game.add_player(:steve)
		game.add_player(enemy)
		expect(game.player2_is_computer?).to be true
	end

	it 'should be able to decide the winner' do
		player1 = double :player, name: "Steve"
		player2 = double :player, name: "Skynet"
		game.add_player(player1)
		game.add_player(player2)
		allow(player1).to receive(:weapon).and_return('rock')
		allow(player2).to receive(:weapon).and_return('paper')
		expect(game.decide_winner).to eq "Skynet"
	end

end