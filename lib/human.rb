class Human
  attr_accessor :player_symbol
  def make_move
    gets.chomp.to_i
  end
end
