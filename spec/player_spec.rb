require 'player'

describe Player do

	let(:player){Player.new}

	it 'should be able to take name' do
		player.name="Steve"
		expect(player.name).to eq "Steve"
	end

	it 'should be able to choose a weapon' do
		player.choose_weapon(:rock)
		expect(player.have_weapon?).to be true
	end

end