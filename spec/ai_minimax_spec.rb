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

    @board.grid[0] = "O"
    @board.grid[1] = "O"
    @board.grid[2] = "X"
    @board.grid[3] = "X"
    @board.grid[4] = "X"
    @board.grid[5] = "+"
    @board.grid[6] = "+"
    @board.grid[7] = "+"
    @board.grid[8] = "+"
  end

  describe 'minimax' do
    it 'should return an integer' do
      @minimax.minmax(@board, @player).is_a?(Integer)
    end

    it 'should take optimal first move' do
      @board.stub(:available_spaces).and_return(["+", "+", "+", "+", "+", "+", "+", "+", "+"])
      @minimax.first_move.should satisfy {|s| [0,2,4,6,8].include?(s)}
    end

    it 'should defend against a split' do
      @board.grid[0] = "X"
      @board.grid[1] = "O"
      @board.grid[2] = "+"
      @board.grid[3] = "+"
      @board.grid[4] = "O"
      @board.grid[5] = "+"
      @board.grid[6] = "+"
      @board.grid[7] = "X"
      @board.grid[8] = "+"
      @minimax.minmax(@board, @player).should == 6
    end
  end

  describe 'score_the_boards(board, player)' do
    it 'should return an hash with range of answers' do
     @minimax.score_the_boards(@board, @player).should be_a_kind_of(Hash)
    end
  end

  describe 'generate_boards(board, player)' do
    it 'holds all the boards' do
      @player = "O"
      @count = 0
      @ply = 2
      @board = Board.new
      @minimax = Minmax.new
      @minimax.i = 0

      @board.grid[0] = "X"
      @board.grid[1] = "O"
      @board.grid[2] = "O"
      @board.grid[3] = "O"
      @board.grid[4] = "O"
      @board.grid[5] = "X"
      @board.grid[6] = "X"
      @board.grid[7] = "+"
      @board.grid[8] = "+"

      boards = @minimax.generate_boards(@board, @player)
      boards.values.include?(["X","O","O","O","O","X","X","X","+"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","X","O"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","+","X"]).should be_true
      boards.values.include?(["X","O","O","O","O","X","X","O","X"]).should be_true
    end
  end

  describe 'score function' do
    it 'scores a draw' do
      @board.grid[0] = "X"
      @board.grid[1] = "O"
      @board.grid[2] = "O"
      @board.grid[3] = "O"
      @board.grid[4] = "O"
      @board.grid[5] = "X"
      @board.grid[6] = "X"
      @board.grid[7] = "X"
      @board.grid[8] = "+"

      minmax = Minmax.new
      minmax.score(@board, 'O', 8).should == 0
    end

    it 'scores a win' do
      board = Board.new
      board.grid[0] = "X"
      board.grid[1] = "O"
      board.grid[2] = "O"
      board.grid[3] = "O"
      board.grid[4] = "O"
      board.grid[5] = "X"
      board.grid[6] = "X"
      board.grid[7] = "+"
      board.grid[8] = "X"

      minmax = Minmax.new
      minmax.score(board, 'O', 7).should == 1
    end

    it 'scores a lose' do
      board = Board.new
      board.grid[0] = "X"
      board.grid[1] = "O"
      board.grid[2] = "O"
      board.grid[3] = "O"
      board.grid[4] = "O"
      board.grid[5] = "X"
      board.grid[6] = "X"
      board.grid[7] = "O"
      board.grid[8] = "+"

      minmax = Minmax.new
      minmax.score(board, 'X', 8).should == -1
    end

    it 'scores two moves left for a win' do
      board = Board.new
      board.grid[0] = "+"
      board.grid[1] = "O"
      board.grid[2] = "X"
      board.grid[3] = "+"
      board.grid[4] = "O"
      board.grid[5] = "+"
      board.grid[6] = "X"
      board.grid[7] = "+"
      board.grid[8] = "+"

      minmax = Minmax.new
      minmax.score(board, 'X', 0).should == -1
      minmax.score(board, 'X', 8).should == -1
    end
  end

  describe 'move_as_somebody(board, player, empty_space)' do
    empty_space = 2

    it 'should return new board Array'do
     @minimax.move_as_somebody(@board, @player, empty_space).grid.should be_a_kind_of(Array)
    end

  end
end

