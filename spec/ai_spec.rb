require 'ai'
require 'board'


describe 'AIhard class' do
  before (:each) do
    @board = Board.new
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  context "make_move method" do

    it 'has player symbol' do
      ai = AIhard.new(@ui)
      ai.player_symbol = 'O'
      ai.player_symbol.should == 'O'
    end

    it 'should receive play from input' do
      @board.grid = [
        "X", "+", "+",
        "+", "X", "+",
        "+", "+", "+"
      ]
      ai = AIhard.new(@ui)
      ai.make_move(@board).should == 8
    end
  end
end

describe 'AIeasy class' do
  before (:each) do
    @board = Board.new
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  context "make_move method" do

    it 'has player symbol' do
      ai = AIeasy.new(@ui)
      ai.player_symbol = 'O'
      ai.player_symbol.should == 'O'
    end

    it 'should receive play from input' do
      @board.grid = [
        "O", "+", "+",
        "X", "+", "+",
        "O", "+", "+"
      ]
      @ui.stub(:gets).and_return("1")
      ai = AIeasy.new(@ui)
      ai.make_move(@board).should_not be_nil
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
      ai = AIeasy.new(@ui)
      ai.random_move(test_board).should be_an(Integer)
    end
  end
end

