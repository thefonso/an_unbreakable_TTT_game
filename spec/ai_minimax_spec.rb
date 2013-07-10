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

    it 'should take optimal first move' do
      @board.stub(:available_spaces).and_return(["+", "+", "+", "+", "+", "+", "+", "+", "+"])
      @minimax.first_move.should satisfy {|s| [0,2,4,6,8].include?(s)}
    end

    it 'should give a winning move' do
      @board=["X","+","+",
              "+","+","+",
              "+","+","X"]

      @minimax.minmax(@board, @player).should == 4
    end

    it 'should return a blocking move' do
      @board=["O","+","+",
              "+","O","+",
              "+","+","+"]

      @minimax.minmax(@board, @player).should == 8
    end

    it 'should defend against a split' do
      @board=["O","X","+",
              "+","X","+",
              "+","O","+"]

      @minimax.minmax(@board, @player).should == 6
    end
    xit 'should return the word DRAW' do
      @board.grid=["O","X","X",
                   "O","O","X",
                   "X","O","O"]

      @minimax.minmax(@board, @player).should == "DRAW"
    end

  end

  describe 'score_a_move(board, player, empty_space)' do
    it 'should return a win move' do
      @board=["X","X","+",
              "+","+","+",
              "+","+","+"]

      @minimax.score_a_move(@board, @player).should == 2
    end

    it 'should return a lose move' do
      @board=["O","O","+",
              "+","+","+",
              "+","+","+"]

      @minimax.score_a_move(@board, @player).should == 2
    end
    it 'should defend against a split' do
      @board=["O","X","+",
              "+","X","+",
              "+","O","+"]

      @minimax.score_a_move(@board, @player).should == 6
    end

    it 'should return a draw' do
      @board=["O","X","X",
              "X","O","O",
              "X","O","X"]

      @minimax.score_a_move(@board, @player).should == 0
    end

  end


  describe 'move_as_somebody(board, player, empty_space)' do
    empty_space = 2

    it 'should return new board Array'do
      @minimax.move_as_somebody(@board, @player, empty_space).grid.should be_a_kind_of(Array)
    end
  end

  describe 'generate_nextboard(board, player)' do
    it 'should clone a board, place a move on it and return the new board'do

      @board.grid=["X","O","O",
                   "O","O","X",
                   "X","+","+"]

      board = @minimax.generate_nextboard(@board, @player)
      #TODO
      #method works...fix this test
      p board.grid
      board.grid.include?(["X","O","O","O","O","X","X","O","+"]).should be_true
    end
  end

  describe 'generate_boards(board, player)' do
    xit 'holds all the boards' do
      @player = "O"
      @count = 0
      @ply = 2
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
end

