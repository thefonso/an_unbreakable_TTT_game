module WinDetection
  def win?(grid, player_symbol)
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
       grid[number_1] == player_symbol &&
       grid[number_2] == player_symbol &&
       grid[number_3] == player_symbol
    end
  end
end
