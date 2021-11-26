# require neccesary files
require_relative "initials"
require_relative "pokemon"
require_relative 'stats'
class Game
  include Initials
  include Stats_formulas
  def start
    # welcome
    @player_name = validate_name
    @pokemon = validate_pokemon

    @pokemon_name = validate_pokemon_name(@pokemon, @player_name)

    # puts @pokemon_name
    @starter =  .new(@pokemon, @pokemon_name)
    # puts @starter
    # puts @starter.name
    # puts @starter.type
    # puts @starter.base_exp
    # puts @starter.effort_points
    # puts @starter.growth_rate
    # puts @starter.moves
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
# puts game
game.start

# testing_pokemon = {
#   "Bulbasaur" => {
#     species: "Bulbasaur",
#     type: %i[grass poison],
#     base_exp: 64,
#     effort_points: { type: :special_attack, amount: 1 },
#     growth_rate: :medium_slow,
#     base_stats: { hp: 45, attack: 49, defense: 49, special_attack: 65, special_defense: 65, speed: 45 },
#     moves: ["tackle", "vine whip"]
#   },
#   "Charmander" => {
#     species: "Charmander",
#     type: %i[fire],
#     base_exp: 62,
#     effort_points: { type: :speed, amount: 1 },
#     growth_rate: :medium_slow,
#     base_stats: { hp: 39, attack: 52, defense: 43, special_attack: 60, special_defense: 50, speed: 65 },
#     moves: ["scratch", "ember"]
#   }
# }

# result = testing_pokemon.find do |key, value|
#   key == "Bulbasaur"
# end
# puts result