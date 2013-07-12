module WinDetection
  def three_in_a_row_win?(array, player_symbol)

    # binding.pry
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
       array[number_1] == player_symbol &&
       array[number_2] == player_symbol &&
       array[number_3] == player_symbol
    end
  end
end
