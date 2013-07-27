module WinDetection

  def win?(board_grid)
    three_in_a_row_win?(board_grid, "X") ||
    three_in_a_row_win?(board_grid, "O")
  end

  def draw?(board_grid)
    board_grid.none? { |move| move == '+' }
  end

  def three_in_a_row_win?(board_grid, player_symbol)
    [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8],
      [1, 4, 7],
      [2, 4, 6],
      [2, 5, 8],
      [3, 4, 5],
      [6, 7, 8]
    ].any? do |number_1, number_2, number_3|
       board_grid[number_1] == player_symbol &&
       board_grid[number_2] == player_symbol &&
       board_grid[number_3] == player_symbol
    end
  end
end
