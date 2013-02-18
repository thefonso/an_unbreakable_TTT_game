class Board
  attr_accessor :grid

  def initialize
    @grid = [
      '+', '+', '+',
      '+', '+', '+',
      '+', '+', '+'
    ]
  end

  def play_move(position, piece)
    @grid[position] = piece
  end

  def printgrid
    board = "\n"
    board << " #{@grid[0]} | #{@grid[1]} | #{@grid[2]}\n"
    board << "-----------\n"
    board << " #{@grid[3]} | #{@grid[4]} | #{@grid[5]}\n"
    board << "-----------\n"
    board << " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} \n"
  end  
end
