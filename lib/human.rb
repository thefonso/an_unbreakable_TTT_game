require_relative 'board'

class Human
  
  def make_move(board)
    @this_board = board
    @player_symbol = 'X'
    p "Choose a move 0..9"
    #TODO - verify input is interger 0..9
    move = gets.chomp.to_i
    if is_move_available(move) == false
      p "Move not available...try again"
      make_move(board)
    else
      return board.grid[move] = @player_symbol
    end
  end

  def is_move_available(move)
    #TODO - returns binary
    if @this_board.grid[move] == "+"
      return true
    else
      return false
    end
  end

end
