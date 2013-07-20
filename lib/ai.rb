require 'minimax'


class AIhard
  attr_reader :player_symbol, :move_engine

  def initialize(player_symbol, move_engine)
    @player_symbol = player_symbol
    @move_engine   = move_engine
  end

  def make_move(board)
    move_engine.get_move(board,player_symbol)
  end
  
  def needs_board?
    true
  end
end

class AIeasy
  attr_accessor :player_symbol, :move_engine

  def initialize(player_symbol, move_engine)
    @player_symbol = player_symbol
    @move_engine   = move_engine
  end

  def make_move(board)
    move_engine.get_move(board)
  end

  def needs_board?
    true
  end
end
