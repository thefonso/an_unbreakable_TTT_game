require 'human'
require 'board'
require 'game_io'

describe Human do

  context "initialize" do
    it 'takes as input a player symbol' do
      io = GameIO.new(StringIO.new, StringIO.new)
      described_class.new("player_symbol", io).player_symbol.should == "player_symbol"
      described_class.new("X", io).player_symbol.should == "X"
      described_class.new("O", io).player_symbol.should == "O"
    end

    it 'takes as input an io object' do
      io = GameIO.new(StringIO.new, StringIO.new)
      described_class.new("player_symbol", io).io.should == io
    end
  end

  context 'io' do
    it 'responds to output' do
      io = GameIO.new(StringIO.new, StringIO.new)
      described_class.new("X", io).io.should respond_to :output
    end

    it 'responds to input' do
      io = GameIO.new(StringIO.new, StringIO.new)
      described_class.new("X", io).io.should respond_to :input
    end
  end

  it 'should receive play from input' do
    mock_input = StringIO.new("1\n")
    io    = GameIO.new(mock_input, StringIO.new)

    human = described_class.new("X", io)
    human.make_move.should == 1
  end

end
