require_relative 'board'

class Game
  attr_reader :board

  def initialize(player_1,player_2,board_state)
   @board = board_state
   @player_1 = player_1
   @player_2 = player_2
  end
end
