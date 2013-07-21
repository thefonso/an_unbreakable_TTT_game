require 'random_move'
require 'board'

describe RandomMove do
  let(:board) {Board.new}

  it 'returns a random move for a given board' do
    [*0..8].should include(described_class.new.get_move(board))
  end

  it 'returns nil if no more moves are available' do
    board.grid = Array.new(9, "X")
    described_class.new.get_move(board).should be_nil
  end
end
