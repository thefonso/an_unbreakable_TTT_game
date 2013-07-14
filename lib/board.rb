class Board
  attr_accessor :grid

  def initialize
    @grid = [
      "+", "+", "+",
      "+", "+", "+",
      "+", "+", "+"
    ]
  end

  def play_move(position, piece)
    @grid[position] = piece
  end

end
