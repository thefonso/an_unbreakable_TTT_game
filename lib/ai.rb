class AI
  attr_accessor :player_symbol

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([AI, 'O'] )
 
  def make_move
    gets.chomp.to_i
  end
end
