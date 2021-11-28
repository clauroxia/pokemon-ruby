# This module is incomplete since we need first to go further with implementation of the battle class
require_relative 'pokedex/moves'
require_relative 'stats'
class Battle
  include Damage_formulas
  # (complete parameters)
  attr_accessor :player, :bot
  def initialize(player, bot)
    @special_movs_list = Pokedex::SPECIAL_MOVE_TYPE
    # Complete this
    @player = player
    @bot = bot
    
  end
  
  def start
    

    turn_order
    # display_winner
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

  def turn_order
    until @player.pokemon.fainted? || @bot.pokemon.fainted?
      display_fighters
      @player_selected_mov = Pokedex::MOVES[@player.pokemon.prepare_for_battle(@player, 'player')]
      @bot_mov = Pokedex::MOVES[@bot.pokemon.prepare_for_battle(@bot, 'bot')]

      first_move = nil

      if compare_priorities
        first_move = @player_selected_mov[:priority] > @bot_mov[:priority] ? [@player, @player_selected_mov] : [@bot, @bot_mov]
      elsif compare_speed
        first_move = @player.pokemon.stats[:speed] > @bot.pokemon.stats[:speed] ? [@player, @player_selected_mov] : [@bot, @bot_mov]
      else
        first_move = [[@player, @player_selected_mov], [@bot, @bot_mov]].sample
      end

      second_move = first_move == @player_selected_mov ? [@bot, @bot_mov] : [@player, @player_selected_mov]

      display_movs(first_move, second_move)
    end
  end

  def compare_priorities
    @player_selected_mov[:priority] < @bot_mov[:priority] || @player_selected_mov[:priority] > @bot_mov[:priority]
  end

  def compare_speed
    @player.pokemon.stats[:speed] < @bot.pokemon.stats[:speed] || @player.pokemon.stats[:speed] > @bot.pokemon.stats[:speed]
  end

  def display_fighters
    fighters = {player: @player, bot: @bot}
    fighters.each do |_key, player|
      puts "#{player.name}'s #{player.pokemon.name} - Level #{player.pokemon.level}"
      puts "HP: #{player.pokemon.stats[:hp]}"
    end
  end

  def display_movs(first_move, second_move)
    puts '-' * 50

    puts "#{first_move[0].name} used #{first_move[1][:name].capitalize}"
    display_damage(second_move)

    puts '-' * 50

    puts "#{second_move[0].name} used #{second_move[1][:name].capitalize}"
    display_damage(first_move)

    puts '-' * 50
  end

  def display_winner
    winner_pok = @player.pokemon
    winner_pok.increase_stats(@bot.pokemon)
    puts "Player #{@player.name} won the battle!"
    puts
  end

  def display_damage(defender)
    damage = calc_damage(defender[0],defender[1])
    puts "It was a CRITICAL hit!" if critical_hit?
    puts @effectiveness_message unless @effectiveness_message.empty?
    puts "And it hit #{defender[0].pokemon.name} with #{damage} damage"
  end
end
