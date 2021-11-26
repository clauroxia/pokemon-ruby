# require neccesary files
require_relative 'initials'

class Game
  include Initials
  def start
    welcome
    # player_name = name_validation
    # pokemon = pokemon_validation
    # name_pokemon_validation(pokemon, player_name)
    # # Then create a Player with that information and store it in @player

    # # Suggested game flow
    # display_menu_options
    # action = option_validation.capitalize
    until action == "Exit"
      case action
      when "Train"
        # train
        action = option_validation.capitalize
      when "Leader"
        # challenge_leader
        action = option_validation.capitalize
      when "Stats"
        # show_stats
        action = option_validation.capitalize
      end
    end

    goodbye
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
