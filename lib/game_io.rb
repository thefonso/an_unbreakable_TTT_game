require 'pry'

class GameIO
  attr_reader :game_input, :game_output
  def initialize(game_input = $stdin, game_output = $stdout)
    @game_input  = game_input
    @game_output = game_output
  end

  def draw_board(board)
    case board.board_name
    when :three_by_three then draw_three_by_three(board)
    when :four_by_four then draw_four_by_four(board)
    end
  end

  def ai_move
    output "AI makes move"
  end

  def human_move
    output "Human makes move"
  end

  def welcome_message 
    output "Hey, welcome to my game. Get ready to be defeated" 
  end
#TODO who won? || draw?
  def winner_message
    output "Someone has won!"
  end

  def draw_message
    output "The game is a DRAW"
  end

  def game_over_message
    output "Game Over"
  end

  def draw_three_by_three(board)
    out_board = "\n"
    out_board << " #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]}\n"
    out_board << "-----------\n"
    out_board << " #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]}\n"
    out_board << "-----------\n"
    out_board << " #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]} \n"
    output out_board
  end

  def output(msg)
    @game_output.puts msg
  end

  def input
    @game_input.gets.chomp.to_i
  end

end
