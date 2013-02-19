require 'game'
require 'board'

describe 'Game class' do
  before(:each) do
    @player_1 = Human.new
    @player_1.player_symbol = 'O'
    @player_2 = AI.new
    @player_2.player_symbol = 'X'
    @board = Board.new
    @game = Game.new(@player_1, @player_2, @board)
  end

  context "valid_move?" do
    it 'is true if board is empty' do
      @board.grid = [
        '+', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      @board.grid = [
        '0', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_false
    end
  end

  context "over?" do
    it 'is false if board is empty' do
      @board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is false if board is not full' do
      @board.grid = [
         'O', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is true if board is full' do
      @board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]
      
      @game.over?.should be_true
    end
  end

  context "evaluate_game" do
    it "should display message if game is over" do
      @board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]

      @game.evaluate_game == "Game Over"
    end

    xit "should switch players" do
      @board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', '+', '+'
      ]
      @game.evaluate_game == ""
    end

  end

  context "play" do
    it "plays a move for O" do
      @board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @player_1.stub(:make_move).and_return(0)
      @game.play
      
      @game.board.grid[0].should == 'O'
    end

    it "plays a move for X" do
      @board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @player_1.stub(:make_move).and_return(0)
      @game.play
      @player_2.stub(:make_move).and_return(1)
      @game.play
      
      @game.board.grid[0].should == 'O'
      @game.board.grid[1].should == 'X'
    end
  end

  context "switch_players" do
    it "should switch the current player" do
      @game.current_player = @player_1 
      @game.switch_players
      @game.current_player.should == @player_2
    end
  end
end
