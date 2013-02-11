class Board
  attr_reader :grid

  def initialize
    @grid = [
      ['+', '+', '+'],
      ['+', '+', '+'],
      ['+', '+', '+']
    ]
  end

  def play_move(row, column, piece)
    @grid[row][column] = piece
  end
end
