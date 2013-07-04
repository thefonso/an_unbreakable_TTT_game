require 'board'
require 'ai_minimax'

describe 'Pseudo_Minimax_Ai' do
  before (:each) do
    @player = "X"
    @count = 0
    @ply = 2
    @board = Board.new
    @minimax = Minmax.new
    @minimax.i = 0

    @board.grid=["O","O","X",
                 "X","X","+",
                 "+","+","+"]
  end

  describe 'minmax' do

    xit 'should take optimal first move' do
      @board.stub(:available_spaces).and_return(["+", "+", "+", "+", "+", "+", "+", "+", "+"])
      @minimax.first_move.should satisfy {|s| [0,2,4,6,8].include?(s)}
    end

    xit 'should give a winning move' do
      @board.grid=["X","+","+",
                   "+","+","+",
                   "+","+","X"]
      
      @minimax.minmax(@board, @player).should == 4
    end

    xit 'should return a blocking move' do
      @board.grid=["O","+","+",
                   "+","O","+",
                   "+","+","+"]

     @minimax.minmax(@board, @player).should == 8
    end

    xit 'should recognize a draw' do
      @board.grid=["O","O","X",
                   "X","X","O",
                   "O","X","X"]

     @minimax.minmax(@board, @player).should == 0
    end

    it 'should defend against a split' do
      @board.grid=["O","X","+",
                   "+","X","+",
                   "+","O","+"]
      
      @minimax.minmax(@board, @player).should == 3
    end

  end

  describe 'score_a_move(board, player, empty_space)' do
    # TODO - need more here
    it 'should return a win move' do
      empty_space = 2
      @board=["X","X","+",
              "+","+","+",
              "+","+","+"]

     @minimax.score_a_move(@board, @player, empty_space).should == 1
    end

    it 'should return a lose move' do
      empty_space = 2
      @board=["O","O","+",
              "+","+","+",
              "+","+","+"]

     @minimax.score_a_move(@board, @player, empty_space).should == -1
    end

    xit 'should defend a split' do
      empty_space = 0
      @board=["X","O","+",
              "+","O","+",
              "+","X","+"]

     @minimax.score_a_move(@board, @player, empty_space).should == 3
    end
  end


  describe 'move_as_somebody(board, player, empty_space)' do
    empty_space = 2

    it 'should return new board Array'do
     @minimax.move_as_somebody(@board, @player, empty_space).grid.should be_a_kind_of(Array)
    end
  end
end

