require 'minimax'

class AIeasy
  attr_accessor :player_symbol, :io

  def initialize(player_symbol, io)
    @io            = io
    @player_symbol = player_symbol
    @move_engine   =  RandomMove.new
  end

  def make_move(board)
    @io.ai_move #TODO - is this the right location for this
    @move_engine.get_move(board)
  end

  def needs_board?
    true
  end
end
