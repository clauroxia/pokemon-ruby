# This module is incomplete since we need first to go further with implementation of the battle class
require_relative 'pokedex/moves'
require_relative 'stats'
class Battle
  include Damage_formulas
  # (complete parameters)
  
  def initialize(player, bot)
    @movement = Pokedex::MOVES["tackle"] # temporal till we have the battle class
    @special_movs_list = Pokedex::SPECIAL_MOVE_TYPE
    # Complete this
    @player = player
    @bot = bot
  end
  
  def start
    display_winner
    display_damage
    # Prepare the Battle (print messages and prepare pokemons)
    # Until one pokemon faints
    # --Print Battle Status
    # --Both players select their moves

    # --Calculate which go first and which second

    # --First attack second
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    # --If first is fainted, print fainted message

    # Check which player won and print messages
    # If the winner is the Player increase pokemon stats
  end

  private
  def display_winner
    winner_pok = @player.pokemon
    winner_pok.increase_stats(@bot.pokemon)
    puts "Player #{@player.name} won the battle!"
    puts
  end

  def display_damage 
    damage = calc_damage(@bot.pokemon.type)
    puts "It was a CRITICAL hit!" if critical_hit?
    puts "Player #{@player.pokemon.name} used #{@movement[:name]} and dealt #{damage} damage to #{@bot.pokemon.name}!"
  end
end
