class Board
  attr_accessor :grid

  def initialize
    # @grid = Array.new("+", 9)
    @grid = [
      "+", "+", "+",
      "+", "+", "+",
      "+", "+", "+"
    ]
  end

  # i'm not seeing where this is called, is it being used?
  def play_move(position, piece)
    @grid[position] = piece
  end

  def update(move, player_side)
    grid[move] = player_side
  end

  def board_name
    :three_by_three
  end

  # should also have a valid?(move) method defined here

  # needs to be defined in your IO object - but board doesn't need to know about the IO object
  def printgrid
    board = "\n"
    board << " #{@grid[0]} | #{@grid[1]} | #{@grid[2]}\n"
    board << "-----------\n"
    board << " #{@grid[3]} | #{@grid[4]} | #{@grid[5]}\n"
    board << "-----------\n"
    board << " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} \n"
  end
end
