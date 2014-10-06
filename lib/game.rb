class Game

	attr_accessor :player1, :player2, :winner

	def initialize
		player1, player2 = nil, nil
		@winner='It\'s a Draw!'
	end

	def add_player(player)
		self.player1 ? self.player2 = player : self.player1 = player unless has_two_players?
	end

	def has_two_players?
		!player1.nil? && !player2.nil?
	end

	def both_have_weapon?
		!player1.weapon.nil? && !player2.weapon.nil?	
	end

	def one_has_weapon?
		player1.weapon.nil? || player2.weapon.nil?
	end

	def player2_is_computer?
		player2.is_a?(Enemy)
	end

	def get_computer_weapon
		player2.randomly_choose_weapon if player2_is_computer?
	end

	def decide_winner
		return @winner if draw?
		rock_results if player1.weapon == 'rock'
		paper_results if player1.weapon == 'paper'
		scissors_results if player1.weapon == 'scissors'
		lizard_results if player1.weapon == 'lizard'
		spock_results if player1.weapon == 'spock'
		return @winner
	end

	private

	def draw?
		player1.weapon.to_s == player2.weapon.to_s
	end

	def rock_results
		return @winner=player1.name if player2.weapon=='scissors' || player2.weapon== 'lizard'
		@winner=player2.name
	end

	def paper_results
		return @winner=player1.name if player2.weapon=='rock' || player2.weapon=='spock'
		@winner=player2.name
	end

	def scissors_results
		return @winner=player1.name if player2.weapon=='paper' || player2.weapon=='lizard'
		@winner=player2.name
	end

	def lizard_results
		return @winner=player1.name if player2.weapon=='paper' || player2.weapon=='spock'
		@winner=player2.name
	end

	def spock_results
		return @winner=player1.name if player2.weapon=='rock' || player2.weapon=='scissors'
		@winner=player2.name
	end	


end