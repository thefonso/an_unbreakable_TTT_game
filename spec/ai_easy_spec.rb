require 'ai'
require 'board'

describe 'ai class' do
  before (:each) do
    @board = Board.new
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  context "make_move method" do
    
    it 'has player symbol' do
      ai = AI.new(@ui)
      ai.player_symbol = 'O'
      ai.player_symbol.should == 'O'
    end
   
    xit 'should receive play from input' do
      @ui.stub(:gets).and_return("1")
      ai = AI.new(@ui)
      ai.make_move.should_not be_nil
    end
  end

  context "random_move method" do
    it "should return a move" do
      @board.grid = [
        "O", "+", "+",
        "X", "+", "+",
        "O", "+", "+"
      ]
      test_board = @board
      ai = AI.new(@ui)
      p ai.random_move(test_board)
    end
  end
end


