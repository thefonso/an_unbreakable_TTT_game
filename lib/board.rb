class Board
  attr_reader :grid

  def initialize
    @grid = [
      '+', '+', '+',
      '+', '+', '+',
      '+', '+', '+'
    ]
    # 0, 1, 2, 3, 4, 5, 6...
  end

  def play_move(position, piece)
    @grid[position] = piece
  end
end
