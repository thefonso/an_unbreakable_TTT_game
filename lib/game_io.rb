require 'pry'

class GameIO
  attr_reader :stdin, :stdout
  def initialize(stdin = $stdin, stdout = $stdout)
    @stdin  = stdin
    @stdout = stdout
  end

  def draw_board(board)
    case board.board_name
    when :three_by_three then draw_three_by_three(board)
    when :four_by_four then draw_four_by_four(board)
    end
  end

  def welcome_message 
    output "Hey, welcome to my game. Get ready to be defeated" 
  end

  def winner_message
    output "Human has won!"
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
    stdout.puts msg
  end

  def input
    stdin.gets
  end
end
