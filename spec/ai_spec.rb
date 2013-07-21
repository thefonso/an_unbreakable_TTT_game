require 'ai'
require 'board'
require 'minimax'
require 'random_move'

describe AIhard do
  let(:minimax_engine) {Minimax.new}
  let(:board) {Board.new}

  context 'player symbol' do
    it 'receives a player symbol' do
      described_class.new("X", minimax_engine).player_symbol.should == "X"
      described_class.new("O", minimax_engine).player_symbol.should == "O"
    end
  end

  context "move" do
    it 'should receive move from move engine' do
      board.grid = [
        "X", "+", "+",
        "+", "X", "+",
        "+", "+", "+"
      ]
      described_class.new("X", minimax_engine).make_move(board).should == 8
    end
  end
end

describe AIeasy do
  let(:random_engine) {RandomMove.new}
  let(:board) {Board.new}

  context 'player symbol' do
    it 'has player symbol' do
      described_class.new("X", random_engine).player_symbol.should == "X"
      described_class.new("O", random_engine).player_symbol.should == "O"
    end
  end

  context "move" do
    it 'should receive move from move engine' do
      board.grid = [
        "O", "+", "+",
        "X", "+", "+",
        "O", "+", "+"
      ]

      described_class.new("X", random_engine).make_move(board).should be_a_kind_of(Integer) 
    end
  end
end
