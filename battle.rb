class Battle
  # (complete parameters)
  def initialize(player, bot)
    # Complete this
    @player = player
    @bot = bot
  end

  def start
    winner = @player
    winner.increase_stats(@bot)
    # Prepare the Battle (print messages and prepare pokemons)
    # Until one pokemon faints
    # --Print Battle Status
    # --Both players select their moves

    # --Calculate which go first and which second

    # --First attack second
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    # --If first is fainted, print fainted message

    # Check which player won and print messages
    # If the winner is the Player increase pokemon stats
  end
end
