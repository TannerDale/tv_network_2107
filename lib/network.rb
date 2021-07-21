class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def get_all_characters
    @shows.flat_map do |show|
      show.characters
    end
  end

  def main_characters
    get_all_characters.find_all do |character|
      character.name == character.name.upcase && character.salary > 500_000
    end
  end

  def actors_by_show
    @shows.map { |show|
      actors = show.characters.map { |character| character.actor }

      [show, actors]
    }.to_h
  end

  def shows_by_actor
    get_all_characters.map { |character|
      actor = character.actor

      shows = @shows.find_all do |show|
        actor_names = show.characters.map { |character| character.actor }
        actor_names.include?(actor)
      end

      [actor, shows]
    }.to_h
  end

  def prolific_actors
    shows_by_actor.each.filter_map do |actor, show|
      actor if show.length > 1
    end
  end
end
