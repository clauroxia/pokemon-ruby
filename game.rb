require_relative "initials"
require_relative "pokemon"
require_relative "stats"
require_relative "battle"
require_relative "player"

class Game
  include Initials
  include Stat_formulas
  def start
    welcome
    @player_name = validate_name
    @pokemon = validate_pokemon

    @pokemon_name = validate_pokemon_name(@pokemon, @player_name)

    # # Then create a Player with that information and store it in @player
    @player = Player.new(@player_name, @pokemon, @pokemon_name, 1)
    # Suggested game flow
    action = validate_options
    until action == "Exit"
      case action
      when "Train"
        # p 'You chose to train'
        train
        action = validate_options
      when "Leader"
        challenge_leader
        action = validate_options
      when "Stats"
        show_stats
        action = validate_options
      end
    end
    # goodbye
  end

  def train
    @bot = Bot.new
    train_intro
    train_decision = take_decision("Fight", "Leave")
    case train_decision
    when "Fight"
      fight_intro("Pokemaniac", @bot.pokemon.species) # move to battle class

      # Just hardcode to make sure damage formulas are working
      battle = Battle.new(@player, @bot)
      battle.start
    when "Leave"
      puts "You escaped!"
    end
  end

  def challenge_leader
    @leader = Player.new("Brock", "Onix", "Onix", 10)
    leader_intro
    leader_decision = take_decision("Fight", "Leave")
    case leader_decision
    when "Fight"
      fight_intro(@leader.name, @leader.pokemon.species) # move to battle class

      # Just hardcode to make sure damage formulas are working
      battle = Battle.new(@player, @leader)
      battle.start
    else
      puts "You escaped!"
    end
  end

  def show_stats
    intro_data = {
      name: @player.pokemon.name,
      kind: @player.pokemon.species,
      level: @player.pokemon.level,
      type: @player.pokemon.type
    }

    intro_data.each do |data_name, value|
      case data_name
      when :name
        puts "\n#{value}:"
      else
        puts "#{data_name.capitalize}: #{value.instance_of?(Array) ? value.join(', ') : value}"
      end
    end

    stats = @player.pokemon.stats
    puts "\nStats:"
    stats.each do |stat_name, value|
      puts "#{stat_name.capitalize}: #{value}"
    end
  end

  def goodbye
    puts "Thanks for playing Pokemon Ruby"
    puts "This game was created with love by:"
    puts "Austin, Claudia, Kat and LuisCA"
  end

  def menu
    # Complete this
  end

  private

  def fight_options
    puts "What do you want to do now?"
    puts "1. Fight        2. Leave" # possible space constant?
  end

  def train_intro
    puts "#{@player.name} challenge Pokemaniac for training"
    puts "Pokemaniac has a #{@bot.pokemon.species} level #{@bot.pokemon.level}"
    fight_options
  end

  def leader_intro
    puts "#{@player.name} challenge the Gym Leader Brock for a fight!"
    puts "Brock has a Onix level 10"
    fight_options
  end

  def take_decision(option1, option2)
    decision = ""
    while decision.strip.empty? || (decision != option1 && decision != option2)
      print "> "
      decision = gets.chomp.capitalize
    end
    decision
  end

  def fight_intro(oponent, oponent_pokemon)
    puts "#{oponent} sent out #{oponent_pokemon.upcase}!"
    puts "#{@player.name} sent out #{@player.pokemon.name.upcase}!"
    puts "#{'-' * 19}Battle Start!#{'-' * 19}"
  end
end

game = Game.new
game.start
game.goodbye
# effectiveness = 1
# multiplier = {}
# effectiveness *= multiplier.empty? ? 1 : multiplier[:multiplier]
# puts effectiveness
