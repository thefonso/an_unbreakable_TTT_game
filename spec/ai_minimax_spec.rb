require 'board'
require 'ai_minimax'

class Pseudo_Minimax_Ai
  include Algorithm::Minimax
  
  module Algorithm::Minimax
    def i=(param)
      @i = param
    end
    
    def initialize_hash
      @virtual_board_hash = {}
    end
  end
end


  describe 'Pseudo_Minimax_Ai' do
    before (:each) do
      @player = "X"
      @count = 0
      @ply = 2
      @board = Board.new
      @minimax = Pseudo_Minimax_Ai.new
      @minimax.i = 0

      @board.grid[0] = "X"
      @board.grid[1] = "X"
      @board.grid[2] = "O"
      @board.grid[3] = "+"
      @board.grid[4] = "O"
      @board.grid[5] = "+"
      @board.grid[6] = "+"
      @board.grid[7] = "O"
      @board.grid[8] = "X"
    
    end

    describe 'minimax' do
      it 'should return an integer' do
        @minimax.minmax(@board, @player).is_a?(Integer)
      end
    end

    describe 'score_the_boards(board, player)' do
      it 'should return an hash with range of answers' do
       @minimax.score_the_boards(@board, @player).should be_a_kind_of(Hash)
      end
    end

    describe 'generate_boards(board, player)' do
      it 'returns an array' do
        @minimax.generate_boards(@board, @player).should be_a_kind_of(Hash)
      end

      it 'holds all the boards' do
        @player = "X"
        @count = 0
        @ply = 2
        @board = Board.new
        @minimax = Pseudo_Minimax_Ai.new
        @minimax.i = 0

        @board.grid[0] = "X"
        @board.grid[1] = "+"
        @board.grid[2] = "+"
        @board.grid[3] = "+"
        @board.grid[4] = "O"
        @board.grid[5] = "+"
        @board.grid[6] = "+"
        @board.grid[7] = "+"
        @board.grid[8] = "X"

        # # 7
        # # turn is X

        boards = @minimax.generate_boards(@board, @player) # what follows are from this branch
        #p boards
        boards.include?(["X","O","X","O","O","X","O","X","X"])
        boards.include?(["X","X","+","+","O","+","+","+","+"])
        boards.include?(["X","+","+","+","O","+","+","+","O"])

        # boards.value?("XX++O++++") # reset board then...
        # boards.value?("X+X+O++++") # reset board then...
        # boards.value?("X++XO++++") # ...
        # boards.value?("X+++OX+++")
        # boards.value?("X+++O+X++")
        # boards.value?("X+++O++X+")

        # boards.value?("X+++O+++X")
        # 
        # # 6
        # # turn is O
        # boards = @minimax.generate_boards("XX++O++++")
        # boards.should include("XXO+O++++")
        # boards.should include("XX+OO++++")
        # boards.should include("XX++OO+++")
        # boards.should include("XX++O+O++")
        # boards.should include("XX++O++O+")
        # boards.should include("XX++O+++O")
        # 
        # # 5
        # # turn is X
        # boards = @minimax.generate_boards("XXO+O++++")
        # boards.should include("XXOXO++++")
        # boards.should include("XXO+OX+++")
        # boards.should include("XXO+O+X++")
        # boards.should include("XXO+O++X+")
        # boards.should include("XXO+O+++X")
        # 
        # # 4
        # # turn is O
        # boards = @minimax.generate_boards("XXOXO++++")
        # boards.should include("XXOXOO+++")
        # boards.should include("XXOXO+O++")
        # boards.should include("XXOXO++O+")
        # boards.should include("XXOXO+++O")
        # 
        # # 3
        # # turn is X
        # boards = @minimax.generate_boards("XXOXOO+++")
        # boards.should include("XXOXOOX++")
        # boards.should include("XXOXO++X+")
        # boards.should include("XXOXO+++X")
        # 
        # # 2
        # # turn is O
        # boards = @minimax.generate_boards("XXOXOOX++")
        # boards.should include("XXOXOOXO+")
        # boards.should include("XXOXO+++O")
        # 
        # # 1
        # # turn is X
        # boards = @minimax.generate_boards("XXOXOOXO+")
        # boards.should include("XXOXOOXOX")
                
        # ...

        # 7!
        # 7 * 6 * 5 * 4 * 3 * 2

        # @minimax.generate_boards(@board, @player)
      end
    end

    describe 'move_as_somebody(board, player, empty_space)' do
      empty_space = 2

      it 'should return new board Array'do
       @minimax.move_as_somebody(@board, @player, empty_space).grid.should be_a_kind_of(Array)
      end

    end
  end

