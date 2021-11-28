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
  def calc_damage(defender, defender_move)
    puts @player.pokemon.stats[:attack]
    base_dmg = (((2 * @player.pokemon.level / 5.0 + 2).floor * calc_special_mov(defender_move, @player.pokemon.stats[:attack], @player.pokemon.stats[:special_attack]) * defender_move[:power] / calc_special_mov(defender_move, @player.pokemon.stats[:defense], @player.pokemon.stats[:special_defense])).floor / 50.0).floor + 2

    puts "Base damage: #{base_dmg}"

    if critical_hit?
      base_dmg *= 1.5
      base_dmg *= calc_effectiveness(defender.pokemon.type, defender_move)
      base_dmg.floor
    else
      base_dmg *= calc_effectiveness(defender.pokemon.type, defender_move)
      base_dmg.floor
    end
  end

  def critical_hit?
    rand(1..3) == 1
  end

  def calc_effectiveness(defender_types, defender_move) # enemy_types is an array of types

    effectiveness = 1
    movement = defender_move[:type]
    multiplier_table = Pokedex::TYPE_MULTIPLIER

    defender_types.each do |type|
      multiplier = multiplier_table.find {|el| el[:user] == movement && el[:target] == type}
      effectiveness *= multiplier ? multiplier[:multiplier] : 1 

    end
    comp_effectiveness_msgs(effectiveness)
    effectiveness
  end
  
  def comp_effectiveness_msgs (effectivenes)
    if effectivenes >= 1.5
      @effectiveness_message = "It's super effective!"
    elsif effectivenes == 1
      @effectiveness_message = ''
    elsif effectivenes >= 0.5
      @effectiveness_message = "It's not very effective...
      "
    else 
      @effectiveness_message = "It's not effective at all"
    end
  end

  def calc_special_mov(mov_type, non_special_move, special_move)
    @special_movs_list.include?(mov_type) ? special_move : non_special_move  
  end
end

