require_relative 'board'
require_relative 'human'
require_relative 'ai'
# What does this need to do?
#
# (imagine CLI, RAILS or Limelight sit up here, how do you write this so SOLID is in place?)
#
# IOobject (interface to CLI, Rails or Limelight)
#
# game(interacts with human, ai, board)
# 
# human(returns a move)
# ai(returns a move)
# board(displays gameboard)
#

class Game
  attr_reader :board

  def initialize(player_1,player_2,board)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
   @current_player = @player_1
  end
  
  def drawgrid
    @board.printgrid
  end

  def play_move(move)
    @board.grid[move] = @current_player
    switch_players
  end

  def play
    get_human_move 
#    get_human_move unless game.next_move
#    redraw_board #sends game.board to IOobject
#    evaluate_game
  end

  def get_human_move
    human = Human.new
    human.make_move.to_i
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


  def switch_players  
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def valid_move?(move)
    @board.grid[move] == '+'
  end

  def over?
    @board.grid.none? {|move| move == '+'}
  end

end
