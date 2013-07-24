require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'windetection'
require_relative 'game_io'

class Game
  attr_reader :board, :player_1, :player_2, :io 
  include WinDetection

  def initialize(player_1, player_2, board, io)
    @player_1  = player_1
    @player_2  = player_2
    @board     = board
    @io        = io
  end

  def start
    while !over?
      drawgrid
      play_move
    end
    drawgrid
    who_won
  end

  def drawgrid
    @io.draw_board(board)
  end

  def play_move
    board.update(get_current_move, current_player_symbol)     
  end

  def get_current_move
    if current_player.needs_board?
      current_player.make_move(board)
    else
      current_player.make_move
    end
  end

  def current_player_symbol 
    current_player.player_symbol
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
