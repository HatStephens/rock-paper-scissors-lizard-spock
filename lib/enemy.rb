class Enemy

	attr_accessor :name, :weapon

	def initialize
		@name = 'Skynet'
	end

	def randomly_choose_weapon
		@weapon = %w{rock paper scissors lizard spock}.sample
	end

end