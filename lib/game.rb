require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'windetection'

class Game
  attr_reader :board, :player_1, :player_2, :io
  include WinDetection

  # it would be better if you pass an IO object into Game
  # intiialize(player1, player2, board, io)
  def initialize(player_1, player_2, board)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
   #@current_player = @player_1
  end

  def start
    while !game.over?
      drawgrid
      play_move
    end
    drawgrid
  end

  def drawgrid
    io.draw_board(board)
    # you should pass your board into an IO object that draws the board - rather than have
    # this method defined in your board class
    # io.draw_board(board)
    board.printgrid
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
    # think of the state of 'current player' as a function of how many moves have been made so far
    if @current_player.player_symbol == @player_1.player_symbol
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def current_player
    if board.move_number % 2 == 0
      player_1
    else
      player_2
    end
  end

  def valid_move?(move)
    # this is a method that is probably better defined in your board class, so your game class doesn't know implementation details of how board works
    # board.valid_move?(move)
    board.grid[move] == '+'
  end

  def over?
    # why does the game glass need to know implementations details of your WinDetection module?
    # would be better to see just a top level method in WinDetection that asks win?
    # and another that asks for draw?
    three_in_a_row_win?(board.grid, @player_1.player_symbol) ||
    three_in_a_row_win?(board.grid, @player_2.player_symbol) ||
    board.grid.none? { |move| move == '+' }
  end
end
