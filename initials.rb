module Initials
  def welcome
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#\n\n"
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts "People call me the POKEMON PROF!\n\n"

    puts "This world is inhabited by creatures called POKEMON! For some"

    puts "people, POKEMON are pets. Others use them for fights. Myself..."
    puts "I study POKEMON as a profession."
  end

  def validate_name
    player = ""
    while player.strip.empty?
      puts "First, what is your name?"
      print "> "
      player = gets.chomp
    end
    puts "Right! So your name is #{player.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, #{player.upcase}! There are 3 POKEMON here! Haha!"
    puts "When I was young, I was a serious POKEMON trainer."
    puts "In my old age, I have only 3 left, but you can have one! Choose!"
    player
  end

  def validate_pokemon
    initials = ["bulbasaur", "charmander", "squirtle"]

    puts "1. Bulbasaur    2. Charmander   3. Squirtle  "
    pokemon = ""

    until initials.find { |initial| pokemon.downcase == initial } && !pokemon.strip.empty?
      print "> "
      pokemon = gets.chomp
    end

    puts "You selected #{pokemon.upcase}. Great choice!"
    pokemon
  end

  def validate_pokemon_name(pokemon, player)
    puts "Do you want to give your pokemon a name?"

    print "> "
    pokemon_name = gets.chomp

    pokemon_name = pokemon_name.nil? || pokemon_name.strip.empty? ? pokemon.capitalize : pokemon_name.capitalize

    puts "#{player.upcase}, raise your young #{pokemon_name.upcase} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    pokemon_name
  end

  def validate_options
    puts "#{'-' * 18}Menu#{'-' * 18}"
    puts "1. Stats     2.Train     3.Leader     4.Exit"

    options = ["Stats", "Train", "Leader", "Exit"]
    selected_option = ""

    until options.find { |option| selected_option == option } && !selected_option.strip.empty?
      print "> "
      selected_option = gets.chomp.strip.capitalize
    end
    selected_option
  end

  def validate_move(player)
    puts "#{player.name}, select your move:"

    pok_moves = player.pokemon.moves
    player.pokemon.moves.each.with_index do |move, i|
      print "#{i + 1}. #{move}     "
    end
    puts
    selected_option = ""
    until pok_moves.find { |option| selected_option == option } && !selected_option.strip.empty?
      print "> "
      selected_option = gets.chomp.strip.downcase
    end
    selected_option
  end
end

##################################################################
# Methods
##################################################################
# def stats(pokemon)
#   puts "HP: #{pokemon.hp}   Attack: #{pokemon.attack}   Defense: #{pokemon.defense}   Speed: #{pokemon.speed}"
# end
