# require neccesary files
require './pokedex/pokemons.rb'
# puts Pokedex::POKEMONS
class Pokemon
  # include neccesary modules
  # all these accesor just for testing purposes
  attr_accessor :species, :name, :type, :base_exp, :effort_points, :growth_rate, :hp, :attack, :defense, :speed, :moves

  def initialize (selected_pokemon, name)
    # Retrieve pokemon info from Pokedex and set instance variables
    pokemon = Pokedex::POKEMONS["#{selected_pokemon.capitalize}"]
    @name = name
    @species = pokemon[:species]
    @type = pokemon[:type]
    @base_exp = pokemon[:base_exp]
    @effort_points = pokemon[:effort_points]
    @growth_rate = pokemon[:growth_rate]

    base_stats = pokemon[:base_stats]
    @hp = base_stats[:hp]
    @attack = base_stats[:attack]
    @defense = base_stats[:defense]
    @speed = base_stats[:speed]
    
    @moves = pokemon[:moves]
  end
    # Calculate Individual Values and store them in instance variable
    # Create instance variable with effort values. All set to 0
    # Store the level in instance variable
    # If level is 1, set experience points to 0 in instance variable.
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    # Calculate pokemon stats and store them in instance variable

  def prepare_for_battle
    # Complete this
  end

  def receive_damage
    # Complete this
  end

  def set_current_move
    # Complete this
  end

  def fainted?
    # Complete this
  end

  # def attack(target)
    # Print attack message 'Tortuguita used MOVE!'
    # Accuracy check
    # If the movement is not missed
    # -- Calculate base damage
    # -- Critical Hit check
    # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
    # -- Effectiveness check
    # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
    # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
    # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
    # ---- "It doesn't affect [target name]!" when effectivenes is 0
    # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
    # Else, print "But it MISSED!"
  # end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
  end

  # private methods:
  # Create here auxiliary methods
end
