require 'board'

describe 'Board class' do
  before (:each) do
    @board = Board.new
  end
  context "initialize method" do

    it 'should have an empty grid' do

      @board.grid.should == [
        "+", "+", "+",
        "+", "+", "+",
        "+", "+", "+"
      ]
    end
  end
  context "play_move method" do
    it 'should play a move' do

      @board.play_move(0, 'o')

      @board.grid.should == [
        "o", "+", "+",
        "+", "+", "+",
        "+", "+", "+"
      ]
    end
  end
  context "valid_move? method" do
    it 'is true if board is empty' do
      @board.grid = [
        "+", "+", "+",
        "+", "+", "+",
        "+", "+", "+"
      ]

      @board.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      @board.grid = [
        "O", "+", "+",
        "+", "+", "+",
        "+", "+", "+"
      ]

      @board.valid_move?(0).should be_false
    end
  end

end
