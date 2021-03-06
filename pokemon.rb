# require neccesary files
require_relative "pokedex/pokemons"
require_relative "initials"
require_relative "stats"
class Pokemon
  include Stat_formulas
  include Initials
  # include neccesary modules
  # all these accesor just for testing purposes
  attr_accessor :species, :name, :type, :base_exp, :effort_points, :growth_rate, :hp, :attack, :defense, :speed,
                :moves, :base_stats, :level, :stats, :exp_points, :effort_values

  def initialize(selected_pokemon, name, level)
    # Retrieve pokemon info from Pokedex and set instance variables
    pokemon = Pokedex::POKEMONS[selected_pokemon.capitalize.to_s]

    @name = name
    @species = pokemon[:species]
    @type = pokemon[:type]
    @base_exp = pokemon[:base_exp]
    @effort_points = pokemon[:effort_points]
    @growth_rate = pokemon[:growth_rate]

    @base_stats = pokemon[:base_stats]

    @moves = pokemon[:moves]

    @individual_values = { hp: rand(0..31), attack: rand(0..31), defense: rand(0..31), special_attack: rand(0..31), special_defense: rand(0..31), speed: rand(0..31) } # extract this random number generation from a module or something

    @effort_values = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }

    @stats = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }

    @level = level # magic number
    @exp_points = 0
    calculate_stats
  end
  # Calculate Individual Values and store them in instance variable (DONE)

  # Create instance variable with effort values. All set to 0(DONE)

  # Store the level in instance variable (DONE)

  # If level is 1, set experience points to 0 in instance variable. (DONE)

  # If level is not 1, calculate the minimum experience point for that level and store it in instance variable. (DONE)

  # Calculate pokemon stats and store them in instance variable
  def prepare_for_battle(player, option)
    # Complete this
    @selected_move = case option
                     when "player"
                       validate_move(player)
                     else
                       @moves.sample
                     end
  end

  def receive_damage(damage)
    stats[:hp] -= damage
  end

  def set_current_move
    # Complete this
  end

  def fainted?
    stats[:hp] <= 0
  end

  def attack(target)
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
  end

  def increase_stats(defeated_pokemon)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # lets imagine we already have a defeated pokemon here
    ##############
    # INCREASE XP
    ##############
    gained_exp = calculate_gain_exp(defeated_pokemon)
    self.exp_points += gained_exp

    puts "#{name} gained #{gained_exp} experience points"

    ##############
    # INCREASE EFFORT POINTS
    ##############
    effort_points = defeated_pokemon.effort_points
    effort_values[effort_points[:type]] += effort_points[:amount]

    puts "#{name} reached level #{@level}!" if check_level_up && @level != 1
    calculate_stats
  end

  def calculate_stats
    base_stats.map do |stat, value|
      case stat
      when :hp
        stats[:hp] = hp_stat
      else
        stats[stat] = other_stats(stat, value)
      end
    end
  end

  private

  def check_level_up
    lvl_table = Pokedex::LEVEL_TABLES[growth_rate]

    base_exp_at_crr_level = lvl_table[level - 1]

    new_level = lvl_table.reverse.find { |exp| exp <= self.exp_points }

    # return true
    if self.exp_points >= base_exp_at_crr_level
      previous_level = level
      self.level = lvl_table.index(new_level) + 1
      previous_level != level

    end
  end
end
