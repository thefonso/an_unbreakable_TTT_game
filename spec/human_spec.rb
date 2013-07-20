require 'human'
require 'board'
require 'mock_io'
require 'pry'

describe Human do

  context "initialize" do
    it 'takes as input a player symbol' do
      mock_io = MockIO.new(StringIO.new, StringIO.new)
      described_class.new("player_symbol", mock_io).player_symbol.should == "player_symbol"
      described_class.new("X", mock_io).player_symbol.should == "X"
      described_class.new("O", mock_io).player_symbol.should == "O"
    end
    
    it 'takes as input an io object' do
      mock_io = MockIO.new(StringIO.new, StringIO.new)
      described_class.new("player_symbol", mock_io).io.should == mock_io
    end
  end

  context 'io' do
    it 'responds to output' do
      mock_io = MockIO.new(StringIO.new, StringIO.new)
      described_class.new("X", mock_io).io.should respond_to :output
    end

    it 'responds to input' do
      mock_io = MockIO.new(StringIO.new, StringIO.new)
      described_class.new("X", mock_io).io.should respond_to :input
    end
  end

  it 'should receive play from input' do
    mock_input = StringIO.new("1\n")
    mock_io    = MockIO.new(mock_input, StringIO.new)

    human = described_class.new("X", mock_io)
    human.make_move.should == 1
  end

end
