class Human
  def player_symbol(piece)
    player_symbol = piece
    return player_symbol 
  end
  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([human, 'X'] )

  def make_move
    p "Human makes move..." # TODO - displayed by IOtower in future refactor
    move = gets.chomp
    return move
  end
end

