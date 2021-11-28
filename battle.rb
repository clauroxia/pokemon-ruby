require_relative 'pokedex/moves'
require_relative 'stats'
class Battle
  include DamageFormulas
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
    display_winner
    reset_hp
    # display_winner
    # first_and_after_round
    # winner_pok = @player.pokemon
    # winner_pok.increase_stats(@bot.pokemon)
    # damage = calc_damage(@bot.pokemon.type)
    # puts "#{@player_name} #{@player.pokemon.name} used #{@movement[:name]} and dealt #{damage} damage to #{@bot.pokemon.name}!"
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

  def reset_hp 
    @player.pokemon.calculate_stats
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

    if check_accuracy(first_move)
      damage = display_damage(second_move, first_move)
      second_move[0].pokemon.receive_damage(damage)
      puts "And it hit #{second_move[0].pokemon.name} with #{damage} damage"
    else
      damage = display_damage(second_move, first_move)
      puts "But it MISSED!"
    end

    puts '-' * 50
    
    puts "#{second_move[0].name} used #{second_move[1][:name].capitalize}"
    if check_accuracy(first_move)
      damage = display_damage(first_move, second_move)
      first_move[0].pokemon.receive_damage(damage)
      puts "And it hit #{first_move[0].pokemon.name} with #{damage} damage"
    else
      damage = display_damage(second_move, first_move)
      puts "But it MISSED!"
    end
    puts '-' * 50
  end

  def display_winner
    winner_pok = @player.pokemon.fainted? ? @bot.pokemon : @player.pokemon
    losser_pok = winner_pok == @player.pokemon ? @bot.pokemon : @player.pokemon
    winner_pok.increase_stats(losser_pok)
    puts '-' * 50
    puts "#{losser_pok.name} FAINTED"
    puts '-' * 50
    puts "#{winner_pok.name} WINS!"
    puts "-------------------Battle Ended!-------------------"
  end

  def display_damage(defender, attacker)
    damage = calc_damage(defender[0],defender[1])
    puts "It was a CRITICAL hit!" if critical_hit?
    puts @effectiveness_message unless @effectiveness_message.empty?
    return damage
  end

  def check_accuracy(move)
    rand(1..100) <= move[1][:accuracy]
#   def first_and_after_round
#     puts "#{@player.name}'s #{@player.pokemon.name} - Level #{@player.pokemon.level}"
#     puts "HP: #{@player.pokemon.stats[:hp]}"
#     puts "Pokemaniac's #{@bot.pokemon.name} - Level #{@bot.pokemon.level}"
#     puts "HP: #{@bot.pokemon.stats[:hp]}\n\n"
#     puts "#{@player.name}, select yout move\n\n"
#     puts "1. #{@player.pokemon.moves[0]}      2. #{@player.pokemon.moves[1]}"
#     @move_selected = take_decision(@player.pokemon.moves[0], @player.pokemon.moves[1])
#     puts "\n\n#{'-' * 50}"
#     puts "#{@player.name} used #{@move_selected}"
#   end

#   def take_decision(option1, option2)
#     decision = ""
#     while decision.strip.empty? || (decision != option1 && decision != option2)
#       print "> "
#       decision = gets.chomp
#     end
#     decision
#   end

#   def effectiveness
#     move_with_char = Pokedex::MOVES.find { |move, _move_char| move == @move_selected } # array["move", hash_with_char]
#     p move_with_char
#     @type_bot_poke = @bot.pokemon.type
#     p @type_bot_poke
#     if @type_bot_poke.length == 2
#       first_array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
#       first_one_hash = first_array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[0] }
#       p first_one_hash[:multiplier]

#       second_array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
#       second_one_hash = second_array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[1] }
#       p second_one_hash[:multiplier]
#     else
#       array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
#       one_hash = array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[0] }
#       p one_hash[:multiplier]
#     end
  end
end
