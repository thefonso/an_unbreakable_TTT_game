require 'minimax'

class AIhard
  attr_reader :player_symbol, :io

  #treat io in the same way as the game class
  def initialize(player_symbol, io)
    @io            = io
    @player_symbol = player_symbol
    @move_engine   = Minimax.new
  end

  def make_move(board)
    @io.ai_move #TODO - is this the right location for this
    @move_engine.get_move(board,player_symbol)
  end

  def needs_board?
    true
  end
end

