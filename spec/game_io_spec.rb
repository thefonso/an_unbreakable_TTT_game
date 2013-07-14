require 'game_io'
require 'board'

describe 'game_io' do
  before(:each) do
    @gameio = GameIO.new
    @board  = Board.new

  end

  context 'draw_three_by_three_board' do
    xit 'should display the board on standard output' do
      @gameio.draw_three_by_three(@board).should == <<-EOF.gsub(/^ {6}/, '')

       + | + | +
      -----------
       + | + | +
      -----------
       + | + | + 
      EOF
    end
  end
  context 'output(msg)'do
    it 'should return msg to standard out' do
      msg = "PING"
      @gamio.output(msg).should == "PING"
    end
  end
end
