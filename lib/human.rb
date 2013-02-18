class Human
  # holds what piece it is and returns a move
  def make_move
    p "Human makes move..." # displayed by IOtower in future refactor
    move = gets.chomp
    return move
  end
end

