class Human
  attr_accessor :player_symbol

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([human, 'X'] )

  def initialize(io = Kernel)
    @io = io
  end
  
  def make_move(board)# TODO - refactor your test for receiving a board
    @io.puts "Human makes move..." # TODO - displayed by IO object in future refactor
    @io.gets.chomp.to_i
  end
end

