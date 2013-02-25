require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'windetection'

class Game
  attr_reader :board
  include WinDetection

  def initialize(player_1, player_2, board)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
   @current_player = @player_1
  end
  
  def drawgrid
    @board.printgrid
  end

  def play_move
    #puts drawgrid
    move = @current_player.make_move
    @board.grid[move] = @current_player.player_symbol
    switch_players
  end

  def switch_players  
    if @current_player.player_symbol == @player_1.player_symbol
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def valid_move?(move)
    @board.grid[move] == '+'
  end

  def over?
    win?(@board.grid, @player_1.player_symbol) ||
    win?(@board.grid, @player_2.player_symbol) ||
    @board.grid.none? { |move| move == '+' }
  end
end
