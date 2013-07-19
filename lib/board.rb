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

  def update(move, player_symbol)
    grid[move] = player_symbol
  end

  def board_name
    :three_by_three
  end

  #TODO valid?(move) method here
  def valid_move?(move)
    grid[move] == '+'
  end
  
end
