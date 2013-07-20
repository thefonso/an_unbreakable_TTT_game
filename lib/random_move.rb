class RandomMove
  def get_move(board)
    board.grid.each_with_index.map do |square, index| 
      if board.grid[index] == "+"
        index
      end
    end.sample
  end
end
