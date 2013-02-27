require 'game'
require 'board'

describe 'Game class' do
  before(:each) do
    @player_1 = Human.new
    @player_1.player_symbol = "O"
    @player_2 = AI.new
    @player_2.player_symbol = "X"
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
    @game.stub(:puts)
  end

  
  context "play_move" do
    it "plays a move for O" do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]
      
      @player_1.stub(:make_move).and_return(0)
      @game.play_move
      
      @game.board.grid[0].should == "O"
    end

    it "plays a move for X" do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]
      
      @player_1.stub(:make_move).and_return(0)
      @game.play_move
      @player_2.stub(:make_move).and_return(1)
      @game.play_move
      
      @game.board.grid[0].should == "O"
      @game.board.grid[1].should == "X"
    end
  end  

  context "valid_move? method" do
    it 'is true if board is empty' do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]

      @game.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      @board.grid = [
         "O", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]

      @game.valid_move?(0).should be_false
    end
  end

  context "over method" do
    it 'is false if board is empty' do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]
      
      @game.over?.should be_false
    end

    it 'is false if board is not full' do
      @board.grid = [
         "O", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]
      
      @game.over?.should be_false
    end

    it 'is true if board is full' do
      @board.grid = [
         "O", "O", "O",
         "O", "O", "O",
         "O", "O", "O"
      ]
      
      @game.over?.should be_true
    end

    it "is the game over" do
      @board.grid = [
         "O", "O", "O",
         "O", "O", "O",
         "O", "O", "O"
      ]

      @game.over?.should be_true
    end

    it "is it a human win" do
      @board.grid = [
         "+", "X", "+",
         "+", "X", "+",
         "+", "X", "+"
      ]

      @game.should be_over
    end


    [
      ["O", "+", "+",
       "O", "+", "+",
       "O", "+", "+"
      ],
      ["+", "O", "+",
       "+", "O", "+",
       "+", "O", "+"
      ],
      ["+", "+", "O",
       "+", "+", "O",
       "+", "+", "O"
      ],
      ["O", "+", "+",
       "+", "O", "+",
       "+", "+", "O"
      ],
      ["+", "+", "O",
       "+", "O", "+",
       "O", "+", "+"
      ],
      ["O", "O", "O",
       "+", "+", "+",
       "+", "+", "+"
      ],
      ["+", "+", "+",
       "O", "O", "O",
       "+", "+", "+"
      ],
      ["+", "+", "+",
       "+", "+", "+",
       "O", "O", "O"
      ],
    ].each do |grid|
      it "is a computer win for this grid: #{grid}" do
        @board.grid = grid
        @game.should be_over # @game.over?.should be_true
      end
    end
  end

 
  
  context "switch_players" do
    xit "switches who the current player is" do
    end
  end

end


