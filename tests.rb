puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#
#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#
#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#\n\n"
puts "Hello there! Welcome to the world of POKEMON! My name is OAK!
People call me the POKEMON PROF!\n\n"
puts "This world is inhabited by creatures called POKEMON! For some
people, POKEMON are pets. Others use them for fights. Myself...
I study POKEMON as a profession."
puts "First, what is your name?"
print "> "
player = gets.chomp
puts "Right! So your name is #{player.upcase}!
Your very own POKEMON legend is about to unfold! A world of
dreams and adventures with POKEMON awaits! Let's go!
Here, #{player.upcase}! There are 3 POKEMON here! Haha!
When I was young, I was a serious POKEMON trainer.
In my old age, I have only 3 left, but you can have one! Choose!\n\n"
puts "1. Bulbasaur    2. Charmander   3. Squirtle"
print "> "
pokemon = gets.chomp
initials = ["Bulbasaur", "Charmander", "Squirtle"]
until initials.find { |initial| pokemon == initial}
  print "> "
  pokemon = gets.chomp
end
puts "\n\nYou selected #{pokemon.upcase}. Great choice!"
puts "Give your pokemon a name?"
print "> "
pokemon_name = gets.chomp


Ausitn