require 'ai'
require 'board'
require 'minimax'
require 'random_move'
require 'game_io'


describe AIhard do
  let(:minimax_engine) {Minimax.new}
  let(:board) {Board.new}

  context 'player symbol' do
    it 'receives a player symbol' do
      io = GameIO.new(StringIO.new, StringIO.new)

      described_class.new("X", io).player_symbol.should == "X"
      described_class.new("O", io).player_symbol.should == "O"
    end
  end

  context "move" do
    it 'should receive move from move engine' do
      io = GameIO.new(StringIO.new, StringIO.new)

      board.grid = [
        "X", "+", "+",
        "+", "X", "+",
        "+", "+", "+"
      ]
      described_class.new("X", io).make_move(board).should == 8
    end
  end
end

describe AIeasy do
  let(:random_engine) {RandomMove.new}
  let(:board) {Board.new}

  context 'player symbol' do
    it 'has player symbol' do
      io = GameIO.new(StringIO.new, StringIO.new)

      described_class.new("X", io).player_symbol.should == "X"
      described_class.new("O", io).player_symbol.should == "O"
    end
  end

  context "move" do
    it 'should receive move from move engine' do
      io = GameIO.new(StringIO.new, StringIO.new)

      board.grid = [
        "O", "+", "+",
        "X", "+", "+",
        "O", "+", "+"
      ]

      described_class.new("X", io).make_move(board).should be_a_kind_of(Integer) 
    end
  end
end
