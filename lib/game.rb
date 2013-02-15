require_relative 'board'
require_relative 'human'
require_relative 'ai'
# What does this need to do?
#
#(imagine CLI, RAILS or Limelight sit up here, how do you write this so SOLID is in place?)
#
# IOobject (interface to CLI, Rails or Limelight)
#
# game(interacts with human, ai, board)
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
  
  def drawgrid
    @board_state.printgrid
  end

  def switch_players  
  end

  def play
    get_human_move unless game.next_move
    redraw_board #sends game.board to IOobject
    evaluate_game
  end

  def get_human_move
  end

  def next_move
  end

  def redraw_board
  end

  def evaluate_game
    if game.finished?
      display_message
    else
      prompt_next_player
      play
    end
  end

  def display_message
    # IOobject lives here
  end

  def prompt_next_player
    #switch players
  end

end
