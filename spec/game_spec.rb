require 'game'
require 'board'

describe 'Game class' do
  before(:each) do
    @player_1 = Human.new
    @player_1.player_symbol = "O" # why not just do: Human.new("O")
    @player_2 = AIhard.new
    @player_2.player_symbol = "X"
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
    # IO object to be passed into your Game class
    # Game.new(player1, player2, board, io)
    @game.stub(:puts) # any call to 'puts' in your Game class should be handled by an IO object (needs to be abstrated into its own class that is soley responsible for IO in your game)
  end

  # this should probably just check to see that the call to your IO object is correctly wired (and in your IO class you'll actually test that the output is what you expect when this call is received)
  context "drawgrid" do
    xit "draws a game grid" do

    end
  end

  context "play_move" do
    it "plays a move for O" do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]

      @player_1.stub(:make_move).and_return(0) # instead of stubbing this you could have this also indirectly test the wiring of how you are taking input from the CL. you can create a generic IO object that is instantiated with a series of moves, separated by \n characters. like this:
                                               # IO.new("0\n1\n2\n")
                                               # the first time you call 'gets' from this IO object, it will return "0", and second time gets is called it will return "1"
      @game.play_move(@board)

      @game.board.grid[0].should == "O"
    end

    it "plays a move for X" do
      @board.grid = [
         "+", "+", "+",
         "+", "+", "+",
         "+", "+", "+"
      ]

      @player_1.stub(:make_move).and_return(0)
      @game.play_move(@board)
      @player_2.stub(:make_move).and_return(1)
      @game.play_move(@board)

      @game.board.grid[0].should == "O"
      @game.board.grid[1].should == "X"
    end
  end

  context "switch_players method" do
    xit "switches the current player" do

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

  # think this context should be called "over?"
  context "over method" do
    it 'is false if board is empty' do # seems like this test is the same as line 95
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

    it "is the game over" do # this is same test as line 105
      @board.grid = [
         "O", "O", "O",
         "O", "O", "O",
         "O", "O", "O"
      ]

      @game.over?.should be_true
    end

    it "is it a human win" do # since you're checking all possible win conditions in the next test, why have this?
      @board.grid = [
         "+", "X", "+",
         "+", "X", "+",
         "+", "X", "+"
      ]

      @game.should be_over
    end


    ['X', 'O'].each do |p|
      [
        [ "#{p}", "+", "+",
          "#{p}", "+", "+",
          "#{p}", "+", "+"
      ],
        [ "+", "#{p}", "+",
          "+", "#{p}", "+",
          "+", "#{p}", "+"
      ],
        [ "+", "+", "#{p}",
          "+", "+", "#{p}",
          "+", "+", "#{p}"
      ],
        [ "#{p}", "+", "+",
          "+", "#{p}", "+",
          "+", "+", "#{p}"
      ],
        [ "+", "+", "#{p}",
          "+", "#{p}", "+",
          "#{p}", "+", "+"
      ],
        [ "#{p}", "#{p}", "#{p}",
          "+", "+", "+",
          "+", "+", "+"
      ],
        [ "+", "+", "+",
          "#{p}", "#{p}", "#{p}",
          "+", "+", "+"
      ],
        [ "+", "+", "+",
          "+", "+", "+",
          "#{p}", "#{p}", "#{p}"
      ],
      ].each do |grid|
        it "is a win for this grid: #{grid}" do
          @board.grid = grid
          @game.should be_over # @game.over?.should be_true
        end
      end
    end
  end

end
