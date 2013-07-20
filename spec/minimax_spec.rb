require 'board'
require 'minimax'

describe 'Pseudo_Minimax_Ai' do
  before (:each) do
    @player = "X"
    @count = 0
    @ply = 2
    @board = Board.new
    @minimax = Minimax.new
    @minimax.i = 0

    @board.grid=["O","O","X",
                 "X","X","+",
                 "+","+","+"]
  end

  describe 'minimax' do

    it 'should take optimal first move' do
      @board.stub(:available_spaces).and_return(["+", "+", "+", "+", "+", "+", "+", "+", "+"])
      @minimax.first_move.should satisfy {|s| [0,2,4,6,8].include?(s)}
    end

    it 'should give a winning move' do
      @board.grid=["X","+","+",
                   "+","+","+",
                   "+","+","X"]

      @minimax.get_move(@board, @player).should == 4
    end

    it 'should return a blocking move' do
      @board.grid=["O","+","+",
                   "+","O","+",
                   "+","+","+"]

      @minimax.get_move(@board, @player).should == 8
    end

    it 'should defend against a split' do
      @board.grid=["O","X","+",
                   "+","X","+",
                   "+","O","+"]

      @minimax.get_move(@board, @player).should == 6
    end
    it 'should place last move board' do
      @board.grid=["X","O","X",
                   "X","O","O",
                   "O","X","+"]

      @minimax.get_move(@board, @player).should == 8
    end
  end

  describe 'score_a_move(board, player, empty_space)' do
    it 'should return a win move' do
      @board=["X","X","+",
              "+","+","+",
              "+","+","+"]

      @minimax.score_a_move(@board, @player)[1].should == 2
    end

    it 'should return a lose move' do
      @board=["O","O","+",
              "+","+","+",
              "+","+","+"]

      @minimax.score_a_move(@board, @player)[0].should == -1
    end
    it 'should defend against a split' do
      @board=["O","X","+",
              "+","X","+",
              "+","O","+"]

      @minimax.score_a_move(@board, @player)[1].should == 6
    end

    it 'should return a draw' do
      @board=["O","X","X",
              "X","O","O",
              "X","O","X"]

      @minimax.score_a_move(@board, @player).should == 0
    end

  end

end

