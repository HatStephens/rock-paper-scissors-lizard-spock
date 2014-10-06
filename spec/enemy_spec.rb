require 'enemy'

describe Enemy do

	let(:enemy) {Enemy.new}

	it 'should be created with the name Skynet' do
		expect(enemy.name).to eq('Skynet')
	end

	it 'should be able to randomly generate a weapon' do
		enemy.randomly_choose_weapon
		expect(enemy.weapon).to be_a String
	end

end