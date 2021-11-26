module Initials
  def welcome
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
  #$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
  #$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
  #$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
  #$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#\n\n"

  puts "Hello there! Welcome to the world of POKEMON! My name is OAK!
  People call me the POKEMON PROF!\n\n"

  puts "This world is inhabited by creatures called POKEMON! For some"
  puts "people, POKEMON are pets. Others use them for fights. Myself..."
  puts "I study POKEMON as a profession."

  player = ""
  while player.strip.empty?
    puts "First, what is your name?"
    print "> "
    player = gets.chomp
  end
  puts "Right! So your name is #{player.upcase}! 
  Your very own POKEMON legend is about to unfold! A world of
  dreams and adventures with POKEMON awaits! Let's go!
  Here, #{player.upcase}! There are 3 POKEMON here! Haha!
  When I was young, I was a serious POKEMON trainer.
  In my old age, I have only 3 left, but you can have one! Choose!\n\n"
  # return player


  initials = ["bulbasaur", "charmander", "squirtle"]
  pokemon = ""
  puts "1. Bulbasaur    2. Charmander   3. Squirtle"
  until initials.find { |initial| pokemon.downcase == initial} 
    print "> "
    pokemon = gets.chomp
  end
  puts "You selected #{pokemon.upcase}. Great choice!"
  # return pokemon



  puts "Do you want to give your pokemon a name?"
  print "> "
  pokemon_name = gets.chomp
  pokemon_name = pokemon if pokemon_name.strip.empty?
  puts "#{player.upcase}, raise your young #{pokemon_name.upcase} by making it fight!"
  puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"



  puts "#{"-"*18}Menu#{"-"*18}"
  puts "1. Stats     2.Train     3.Leader     4.Exit"


  options = %w[Stats Train Leader Exit]
  option_select = ''
  until options.find { |option| option_select.downcase == option}
    print "> "
    option_select = gets.chomp
  end

  #   puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
  #   #$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
  #   #$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
  #   #$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
  #   #$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#\n\n"

  #   puts "Hello there! Welcome to the world of POKEMON! My name is OAK!
  #   People call me the POKEMON PROF!\n\n"

  #   puts "This world is inhabited by creatures called POKEMON! For some"
  #   puts "people, POKEMON are pets. Others use them for fights. Myself..."
  #   puts "I study POKEMON as a profession."
  # end

  # def name_validation
  #   player = ""
  #   while player.strip.empty?
  #     puts "First, what is your name?"
  #     print "> "
  #     player = gets.chomp
  #   end
  #   puts "Right! So your name is #{player.upcase}! 
  #   Your very own POKEMON legend is about to unfold! A world of
  #   dreams and adventures with POKEMON awaits! Let's go!
  #   Here, #{player.upcase}! There are 3 POKEMON here! Haha!
  #   When I was young, I was a serious POKEMON trainer.
  #   In my old age, I have only 3 left, but you can have one! Choose!\n\n"
  #   return player
  # end
  
  # def pokemon_validation(pokemon, player)
  #   initials = ["bulbasaur", "charmander", "squirtle"]
  #   pokemon = ""
  #   puts "1. Bulbasaur    2. Charmander   3. Squirtle  "
  #   until initials.find { |initial| pokemon.downcase == initial} || pokemon.strip.empty?
  #     print "> "
  #     pokemon = gets.chomp
  #   end
  #   puts "You selected #{pokemon.upcase}. Great choice!"
  #   return pokemon
  # end

  # def name_pokemon_validation(pokemon, player)
  #   puts "Do you want to give your pokemon a name?"
  #   print "> "
  #   pokemon_name = gets.chomp
  #   pokemon_name = pokemon if pokemon_name.strip.empty?
  #   puts "#{player.upcase}, raise your young #{pokemon_name.upcase} by making it fight!"
  #   puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
  # end

  # def display_menu_options
  #   puts "#{"-"*18}Menu#{"-"*18}"
  #   puts "1. Stats     2.Train     3.Leader     4.Exit"
  # end

  # def option_validation
  #   options = %w[Stats Train Leader Exit]
  #   until options.find { |option| option_select.downcase == option}
  #     print "> "
  #     option_select = gets.chomp
  #   end
  end
end



















##################################################################
# Methods
##################################################################
def stats(pokemon)
  puts "HP: #{pokemon.hp}   Attack: #{pokemon.attack}   Defense: #{pokemon.defense}   Speed: #{pokemon.speed}"
end

