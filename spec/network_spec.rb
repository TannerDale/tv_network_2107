require './lib/character'
require './lib/show'
require './lib/network'

RSpec.describe Network do
  context 'initialize' do
    nbc = Network.new("NBC")

    it 'exists' do
      expect(nbc).to be_a(Network)
    end

    it 'has attributes' do
      expect(nbc.name).to eq("NBC")
      expect(nbc.shows).to eq([])
    end
  end

  context 'adding shows' do
    nbc = Network.new("NBC")

    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    it 'can add shows' do
      nbc.add_show(knight_rider)
      nbc.add_show(parks_and_rec)

      expect(nbc.shows).to eq([knight_rider, parks_and_rec])
    end
  end

  context 'characters and actors' do
    nbc = Network.new("NBC")

    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    it 'has main_characters' do
      expect(nbc.main_characters).to eq([kitt])
    end

    it 'has acotrs by show' do
      expected = {
        knight_rider => ["David Hasselhoff", "William Daniels"],
        parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      }
      expect(nbc.actors_by_show).to eq(exepcted)
    end
  end
end
