require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'iotower.rb'

class Game
  attr_reader :board
  attr_accessor :current_player

  def initialize(player_1, player_2, board)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
   @current_player = @player_1
  end
  
  def drawgrid
    @board.printgrid
  end

  def evaluate_game
    io = IOtower.new
    if over? == true
      io.display_message_end
    else
      switch_players
    end
  end

  def play
    move = @current_player.make_move
    @board.grid[move] = @current_player.player_symbol
    # switch_players
    evaluate_game
  end

  def switch_players  
    if @current_player.player_symbol == @player_1.player_symbol
      @current_player = @player_2
      io.message(@player_2)
    else
      @current_player = @player_1
      io.message(@player_1)
    end
  end

  def valid_move?(move)
    @board.grid[move] == '+'
  end

  def over?
    @board.grid.none? {|move| move == '+'}
  end

end
