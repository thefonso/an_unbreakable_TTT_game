class RandomMove
  def get_move(board)
    result = Array.new
    board.grid.each_with_index.map do |square, index| 
      if board.grid[index] == "+"
        result << index
      end
    end

    return result.sample
  end
end
