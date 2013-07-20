require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'windetection'
require_relative 'game_io'

#TODO -
# add "move out of bounds try again"
# add "move taken please try again"  
class Game
  attr_reader :board, :player_1, :player_2, :io 
  include WinDetection

  def initialize(player_1, player_2, board, io)
   @io             = io
   @board          = board
   @player_1       = player_1
   @player_2       = player_2
   @current_player = player_1
  end

  def start
    if !game.over?
      drawgrid
      play_move
      switch_players
    else
      who_won
    end
    drawgrid
  end
  
  def drawgrid
    @io.draw_board(board)
  end
  
  def play_move
    board.update(get_current_move, current_player_token)
  end

  def get_current_move
    current_player.make_move(board)
  end

  def current_player_token
    current_player.player_symbol
  end

  def switch_players  
    current_player 
  end

  def current_player
    if board.move_number % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    win?(@board.grid)||draw?(@board.grid) 
  end

  def who_won
    #TODO - ask about this...is there a better SOLID way?
    if three_in_a_row_win?(@board.grid, @player_1.player_symbol)
      return "The winner is "+@player_1.player_symbol
    elsif three_in_a_row_win?(@board.grid, @player_2.player_symbol)
      return "The winner is "+@player_2.player_symbol
    elsif @board.grid.none? { |move| move == '+' }
      return "DRAW"
    end
  end
end
