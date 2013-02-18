class Human
  attr_accessor :player_symbol

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([human, 'X'] )

  def initialize(io = Kernal)
    @io = io
  end
  
  def make_move
    @io.puts "Human makes move..." # TODO - displayed by IOtower in future refactor
    @io.gets.chomp.to_i
  end
end

