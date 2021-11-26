require_relative "initials"
require_relative "pokemon"
require_relative 'stats'
class Game
  include Initials
  include Stats_formulas
  def start
    welcome
    @player_name = validate_name
    @pokemon = validate_pokemon

    @pokemon_name = validate_pokemon_name(@pokemon, @player_name)

    # puts @pokemon_name
    @starter = Pokemon.new(@pokemon, @pokemon_name)
    # # Then create a Player with that information and store it in @player

    # Suggested game flow
    action = validate_options
    until action == "Exit"
      case action
      when "Train"
        p 'You chose to train'
        action = validate_options
      when "Leader"
        p 'You chose to challenge the leader'
        action = validate_options
      when "Stats"
        show_stats
        action = validate_options
      end
    end

    # goodbye
  end

  def train
    # Complete this
  end

  def challenge_leader
    # Complete this
  end

  def show_stats
    intro_data = {
      name: @starter.name, 
      kind: @starter.species, 
      level: @starter.level, 
      type: @starter.type
    }

    intro_data.each do |data_name, value|
      case data_name
      when :name
        puts "\n#{value}:"
      else
        puts "#{data_name.capitalize}: #{value.class == Array ? value.join(", ") : value}"
      end
    end

    stats = @starter.stats
    puts "\nStats:"
    stats.each do |stat_name, value|
      puts "#{stat_name.capitalize}: #{value}"
    end
  end

  def goodbye
    # Complete this
  end

  def menu
    # Complete this
  end
end

game = Game.new
game.start
