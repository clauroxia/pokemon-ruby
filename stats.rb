module StatFormulas
  # needed data
  def hp_stat
    ((((2 * @base_stats[:hp]) + @individual_values[:hp] + @effort_values[:hp]) * @level / 100) + @level + 10).floor
  end

  def other_stats(stat_name, value)
    ((((2 * value) + @individual_values[stat_name] + calc_effort_value(stat_name)) * @level / 100) + 5).floor
  end

  def calc_effort_value(stat_name)
    (@effort_values[stat_name] / 4.0).floor
  end

  def calculate_gain_exp(defeated_pokemon)
    (defeated_pokemon.base_exp * defeated_pokemon.level / 7.0).floor
  end
end

# INCOMPLETE MODULE
module Damage_formulas
  def calc_damage(defender_type_move)
    base_dmg = ((((2 * @player.pokemon.level / 5.0) + 2).floor * calc_special_mov(@player.pokemon.stats[:special_attack],
                                                                                  "attack") * @movement[:power] / calc_special_mov(@player.pokemon.stats[:special_defense],
                                                                                                                                   "defense")).floor / 50.0).floor + 2
    puts base_dmg
    if critical_hit?
      base_dmg *= 1.5
      base_dmg *= calc_effectiveness(defender_type_move)
    else
      base_dmg *= calc_effectiveness(defender_type_move)
    end
  end

  def critical_hit?
    rand(1..16) == 1
  end

  def calc_effectiveness(enemy_types) # enemy_types is an array of types
    effectiveness = 1
    movement = @movement[:type]
    multiplier_table = Pokedex::TYPE_MULTIPLIER

    enemy_types.each do |type|
      multiplier = multiplier_table.find { |el| el[:user] == movement && el[:target] == type }
      p multiplier
      effectiveness *= multiplier ? multiplier[:multiplier] : 1
    end
    effectiveness
  end

  def calc_special_mov(mov, option)
    if @special_movs_list.include?(@movement[:type])
      mov
    else
      option == "attack" ? @player.pokemon.stats[:attack] : @player.pokemon.stats[:defense]
    end
  end
end
