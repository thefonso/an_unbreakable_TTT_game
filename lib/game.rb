require 'board'
require 'human'
require 'ai'
require 'windetection'
require 'game_io'
require 'pry'

class Game
  include WinDetection

  def initialize(player_1, player_2, board, io)
    @player_1  = player_1
    @player_2  = player_2
    @board     = board
    @io        = io
  end

  def start
    welcome_message
    while !over?
      drawgrid
      play_move
    end
    drawgrid
    game_over_message
    game_result_message
  end

  private

  attr_reader :board, :player_1, :player_2, :io

  def drawgrid
    @io.draw_board(board)
  end

  def play_move
     move = get_current_move
     if valid_move?(move)
      board.update(move, current_player_symbol)
    else
      range_error
      play_move
    end
  end

  def valid_move?(move)
    board.grid[move] == '+'
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

  def game_result_message
    if win?(board.grid)
      [player_1.player_symbol, player_2.player_symbol].each do |player_symbol|
      winner_message(player_symbol) if three_in_a_row_win?(board.grid, player_symbol)
      end
    else
      draw_message
    end
  end

  def range_error
    io.range_error
  end

  def welcome_message
    io.welcome_message
  end

  def game_over_message
    io.game_over_message
  end

  def winner_message(player_symbol)
    io.winner_message(player_symbol)
  end

  def draw_message
    io.draw_message
  end

end
