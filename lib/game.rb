require_relative 'board'
require_relative 'human'
require_relative 'ai'
# What does this need to do?
#
#(imagine CLI, RAILS or Limelight sit up here how do you write this so SOLID is in place?)
#
# IOobject (interface to CLI, Rails or Limelight)
#
# game(interacts with human, ai, board
# 
# human(returns a move)
# ai(returns a move)
# board(displays gameboard)
#
#
class Game
  attr_reader :board_state

  def initialize(player_1,player_2,board_state)
   @board_state = board_state
   @player_1 = player_1
   @player_2 = player_2
  end
  
 end
