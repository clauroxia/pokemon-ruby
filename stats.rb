# require './pokedex/pokemons.rb'
module Stats_formulas
  # needed data
  def hp_stat
    ((2 * @base_stats[:hp] + @individual_values[:hp] + @effort_values[:hp]) * @level / 100 + @level + 10).floor
  end
  def other_stats (stat_name, value)
    ((2 * value + @individual_values[stat_name] + @effort_values[stat_name]) * @level / 100 + 5).floor
  end
end