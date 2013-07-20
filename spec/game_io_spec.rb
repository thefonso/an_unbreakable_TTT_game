require 'game_io'
require 'board'


describe GameIO do
  before(:each) do
    @board     = Board.new
    test_in    = StringIO.new("some test input\n")
    test_out   = StringIO.new
    @test_io   = GameIO.new(test_in, test_out)
  end

  context 'welcome message' do
    it 'should display a welcome message' do
      @test_io.welcome_message
      @test_io.game_output.string.should == "Hey, welcome to my game. Get ready to be defeated\n"
    end
  end

  context 'winner message' do
    it 'should display a winner message' do
      @test_io.winner_message
      @test_io.game_output.string.should == "Human has won!\n"
    end
  end

  context 'draw message' do
    it 'should display a game draw message' do
      @test_io.draw_message
      @test_io.game_output.string.should == "The game is a DRAW\n"
    end
  end

  context 'game over message' do
    it 'should display a game over message' do
      @test_io.game_over_message
      @test_io.game_output.string.should == "Game Over\n"
    end
  end

  context 'draw_three_by_three_board' do
    it 'should display the board on standard output' do
      @test_io.draw_three_by_three(@board)
      @test_io.game_output.string.should == <<-EOF.gsub(/^ {6}/, '')

       + | + | +
      -----------
       + | + | +
      -----------
       + | + | + 
      EOF
    end
  end

  context 'input' do
    it 'returns an integer representing a human player move' do
      test_input = StringIO.new("1\n")
      test_io = GameIO.new(test_input, StringIO.new)
      test_io.input.should == 1
    end
  end

end
