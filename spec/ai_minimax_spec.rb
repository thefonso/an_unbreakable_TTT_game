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
    xit 'should return an integer' do
      @minimax.minmax(@board, @player).is_a?(Integer)
    end

    xit 'should take optimal first move' do
      @board.stub(:available_spaces).and_return(["+", "+", "+", "+", "+", "+", "+", "+", "+"])
      @minimax.first_move.should satisfy {|s| [0,2,4,6,8].include?(s)}
    end

    xit 'should defend against a split' do
      @board.grid=["X","O","+",
                   "+","O","+",
                   "+","X","+"]
      
      @minimax.minmax(@board, @player).should == (6 || 3)
    end

    it 'should give a winning move' do
      @board.grid=["O","X","+",
                   "+","O","+",
                   "+","+","+"]
      
      @minimax.minmax(@board, @player).should == 8
    end


    xit 'should block enemy move' do
    end

    xit 'should recognize a lost game' do
    end

    xit 'should recognize a draw' do
    end
  end

  describe 'score_the_boards(board, player)' do
    # TODO - need more here
    it 'should return an hash with range of answers' do
     @minimax.score_the_boards(@board, @player).should be_a_kind_of(Hash)
    end
  end

  describe 'generate_boards(board, player)' do
    it 'holds all the boards' do
      @player = "O"
      @count = 0
      @board = Board.new
      @minimax = Minmax.new
      @minimax.i = 0

      @board.grid=["X","O","O",
                   "O","O","X",
                   "X","+","+"]

      boards = @minimax.generate_boards(@board, @player)
      
      boards.values.include?(["X","O","O","O","O","X","X","X","+"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","X","O"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","+","X"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","O","X"]).should be_true
    end
  end
 
  describe 'move_as_somebody(board, player, empty_space)' do
    empty_space = 2

    it 'should return new board Array'do
     @minimax.move_as_somebody(@board, @player, empty_space).grid.should be_a_kind_of(Array)
    end
  end
end

