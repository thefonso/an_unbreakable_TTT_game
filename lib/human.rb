require_relative 'board'
 
class Human
  attr_reader :board_test
  # a human exist
  # a human holds a piece 
  # a human receives the board 
  # a human places piece on the board (makes a move)
  def makes_move(board)
   # receives board
    board_test = board 
    return board_test
  end
end

