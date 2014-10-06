require 'weapon'

describe Weapon do

	let(:weapon){Weapon.new}

	it 'should be able to be passed a type of weapon' do
		weapon.choose(:rock)
		expect(weapon.weapon).to eq(:rock)
	end

end