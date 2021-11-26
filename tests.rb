# require neccesary files
require_relative 'initials'

class Game
  include Initials
  def start
    welcome
    player_name = validate_name
    pokemon = validate_pokemon

    validate_pokemon_name(pokemon, player_name)
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
        p 'You chose to see your stats'
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
    # Complete this
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
