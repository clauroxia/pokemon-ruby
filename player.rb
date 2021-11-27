# require neccesary files
class Player
  # (Complete parameters)
  def initialize
    # Complete this
  end

  def select_move
    # Complete this
  end
end

class Bot < Player
  def initialize
    Pokedex::POKEMONS.each {|pokemon_specie, features| array_pkm = features[:species]}
    @pokemon_of_bot = array_pkm.sample
    super("Random Person", @pokemon_of_bot, "bot_pokemon_name")
  end
end



# Create a class Bot that inherits from Player and override the select_move method
