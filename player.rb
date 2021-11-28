class Player
  attr_accessor :name, :pokemon, :selected_move
  def initialize(player_name, pokemon, pokemon_name, level)
    @name = player_name
    @pokemon = Pokemon.new(pokemon, pokemon_name, nil ? 1 : level)
  end

  def select_move
    movement_pokemon = @pokemon.moves
    puts "#{@player_name}, select your move:"
    movement_pokemon.each do |move, index|
      puts "#{index + 1}. #{move}"
    end
    print "> "
    @selected_move = gets.chomp
  end
end

class Bot < Player
  attr_accessor :pokemon
  def initialize
    @pokemon = Pokedex::POKEMONS.keys.sample
    super("Random Person", @pokemon, @pokemon, rand(1..7))
  end

  def select_move
    movement_pokemon_bot = @pokemon.moves.sample
  end
end



# Create a class Bot that inherits from Player and override the select_move method
