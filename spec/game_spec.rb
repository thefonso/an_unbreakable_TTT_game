require 'game_io'
require 'game'
require 'board'
require 'pry'

describe Game do
  before(:each) do
    test_in                 = StringIO.new("some test input\n")
    test_out                = StringIO.new
    @io                     = GameIO.new(test_in, test_out)
    @player_1               = Human.new("O", @io)
    @player_2               = AIhard.new("X",@io)
    @board                  = Board.new
    @game                   = Game.new(@player_1, @player_2, @board, @io)
    @game.stub(:puts)
  end

  context "play_move method" do
    it 'should update a move' do

      @game.play_move

      @board.grid.should == [
        "+", "+", "+",
        "+", "X", "+",
        "+", "+", "+"
      ]
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

  context "who_won" do
    it "says O won the game" do
      @board.grid = [
        "+", "O", "X",
        "+", "O", "+",
        "X", "O", "+"
      ]
      @game.who_won
      @io.game_output.string.should == "O has won!\n"
    end
    it "says X won the game" do
      @board.grid = [
        "X", "O", "O",
        "+", "X", "+",
        "+", "+", "X"
      ]
      @game.who_won
      @io.game_output.string.should == "X has won!\n"
    end
    it "shows game to be a DRAW" do
      @board.grid = [
        "X", "O", "O",
        "O", "X", "X",
        "X", "O", "O"
      ]
      @game.who_won
      @io.game_output.string.should == "The game is a DRAW\n"
    end
  end
end


