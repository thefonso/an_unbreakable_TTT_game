require 'pry'

class Human
  attr_reader :player_symbol, :io

  def initialize(player_symbol, io)
    @player_symbol = player_symbol
    @io = io
  end
 
  def make_move 
    @io.input
  end

  def needs_board?
   false
  end
end

