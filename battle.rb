# This module is incomplete since we need first to go further with implementation of the battle class
require_relative "pokedex/moves"
require_relative "stats"

class Battle
  include DamageFormulas
  # (complete parameters)

  def initialize(player, bot)
    @movement = Pokedex::MOVES["tackle"] # temporal till we have the battle class
    @special_movs_list = Pokedex::SPECIAL_MOVE_TYPE
    # Complete this
    @player = player
    @bot = bot
  end

  def start
    winner_pok = @player.pokemon
    winner_pok.increase_stats(@bot.pokemon)

    # Prepare the Battle (print messages and prepare pokemons)
    # Until one pokemon faints
    # --Print Battle Status
    # --Both players select their moves
    damage = calc_damage(@bot.pokemon.type)
    puts "Player #{@player.pokemon.name} used #{@movement[:name]} and dealt #{damage} damage to #{@bot.pokemon.name}!"
    # --Calculate which go first and which second

    # --First attack second
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    # --If first is fainted, print fainted message

    # Check which player won and print messages
    # If the winner is the Player increase pokemon stats
    first_and_after_round
  end

  def first_and_after_round
    puts "#{@player.name}'s #{@player.pokemon.name} - Level #{@player.pokemon.level}"
    puts "HP: #{@player.pokemon.stats[:hp]}"
    puts "Pokemaniac's #{@bot.pokemon.name} - Level #{@bot.pokemon.level}"
    puts "HP: #{@bot.pokemon.stats[:hp]}\n\n"
    puts "#{@player.name}, select yout move\n\n"
    puts "1. #{@player.pokemon.moves[0]}      2. #{@player.pokemon.moves[1]}"
    @move_selected = take_decision(@player.pokemon.moves[0], @player.pokemon.moves[1])
    puts "\n\n#{'-' * 50}"
    puts "#{@player.name} used #{@move_selected}"
    effectiveness
  end

  def take_decision(option1, option2)
    decision = ""
    while decision.strip.empty? || (decision != option1 && decision != option2)
      print "> "
      decision = gets.chomp
    end
    decision
  end

  def effectiveness
    move_with_char = Pokedex::MOVES.find { |move, _move_char| move == @move_selected } # array["move", hash_with_char]
    p move_with_char
    @type_bot_poke = @bot.pokemon.type
    p @type_bot_poke
    if @type_bot_poke.length == 2
      first_array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
      first_one_hash = first_array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[0] }
      p first_one_hash[:multiplier]

      second_array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
      second_one_hash = second_array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[1] }
      p second_one_hash[:multiplier]
    else
      array_hashes_to_find = Pokedex::TYPE_MULTIPLIER.select { |hash| hash[:user] == move_with_char[1][:type] }
      one_hash = array_hashes_to_find.find { |hash| hash[:target] == @type_bot_poke[0] }
      p one_hash[:multiplier]
    end
  end
end
