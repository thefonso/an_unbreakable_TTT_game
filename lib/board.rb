class Board
  attr_accessor :grid

  def initialize
    @grid = [
      "+", "+", "+",
      "+", "+", "+",
      "+", "+", "+"
    ]
  end
  def move_number
    grid.count("+")
  end

  def update(position, player_symbol)
    @grid[position] = player_symbol
  end

  def board_name
    :three_by_three
  end

  def valid_move?(move)
    grid[move] == '+'
  end
  
end
