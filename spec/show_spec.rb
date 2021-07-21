require './lib/character'
require './lib/show'

RSpec.describe Show do
  context 'initialize' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    it 'exists' do
      expect(knight_rider).to be_a(Show)
    end

    it 'has attributes' do
      expect(knight_rider.name).to eq("Knight Rider")
      expect(knight_rider.creator).to eq("Glen Larson")
      expect(knight_rider.characters).to eq([michael_knight, kitt])
    end
  end

  context 'actors and salaries' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    it 'has a total total_salary' do
      expect(knight_rider.total_salary).to eq(2_600_000)
    end

    it 'has a highest_paid_actor' do
      expect(knight_rider.highest_paid_actor).to eq("David Hasselhoff")
    end

    it 'has actor name' do
      expect(knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
    end
  end
end
