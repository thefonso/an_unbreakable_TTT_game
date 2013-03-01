class AI
  attr_accessor :player_symbol

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([AI, 'O'] )
  # TODO - displayed by IOtower in future refactor
  def initialize(io = Kernel)
    @io = io
  end

  def make_move
    @io.puts "AI takes move..."
    @io.gets.chomp.to_i
    random_move(board)
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
