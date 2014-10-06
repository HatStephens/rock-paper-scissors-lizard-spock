class Player

	attr_accessor :name, :weapon

	def initialize
		@weapon=nil
	end

	def choose_weapon(weapon)
		@weapon = weapon
	end

	def have_weapon?
		!@weapon.nil?
	end

end