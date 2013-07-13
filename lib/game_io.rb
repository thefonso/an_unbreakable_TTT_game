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
  end

  def draw_message
  end

  def end_game_message
  end

  def draw_three_by_three(board)
    board = "\n"
    board << " #{@grid[0]} | #{@grid[1]} | #{@grid[2]}\n"
    board << "-----------\n"
    board << " #{@grid[3]} | #{@grid[4]} | #{@grid[5]}\n"
    board << "-----------\n"
    board << " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} \n"
    output board
  end

  def output(msg)
    stdout.puts msg
  end

  def input
    stdin.gets
  end
end
