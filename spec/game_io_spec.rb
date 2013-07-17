require 'game_io'
require 'board'


describe GameIO do
  before(:each) do
    @gameio = GameIO.new
    @board  = Board.new
  end

  context 'welcome_message' do
    it 'should display a welcome message' do
      test_in   = StringIO.new("some test input\n")
      test_out  = StringIO.new
      test_io   = GameIO.new(test_in, test_out)

      test_io.welcome_message
      test_io.game_output.string.should == "Hey, welcome to my game. Get ready to be defeated\n"
    end
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


end
