require_relative 'ai_minimax'

class AI
  attr_accessor :player_symbol
  

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([AI, 'O'] )
  # TODO - displayed by IOtower in future refactor
  def initialize(io = Kernel)
    @io = io
  end

  def make_move(board)
    @io.puts "AI takes move..."
    ai = Minmax.new
    ai.minmax(board,player_symbol)
  end

  def random_move(board)
    board = board.grid
    @empty_spaces = []

    board.size.times do |empty|
      if board[empty] == '+'
        @empty_spaces << empty
      end
    end
    return @empty_spaces.sample
  end

end
