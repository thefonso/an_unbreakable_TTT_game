require 'game'
require 'iotower'

describe 'Game class' do
  before(:each) do
    io = IOtower.new
    @game = Game.new(io)
  end

  context "valid_move?" do
    it 'is true if board is empty' do
      @game.board.grid = [
        '+', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      @game.board.grid = [
        '0', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_false
    end
  end

  context "over?" do
    it 'is false if board is empty' do
      @game.board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is false if board is not full' do
      @game.board.grid = [
         'O', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is true if board is full' do
      @game.board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]
      
      @game.over?.should be_true
    end
  end

  context "evaluate_game" do
    it "should display message if game is over" do
      @game.board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]

      @game.evaluate_game == "Game Over"
    end
  end

  context "play" do
    it "plays a move for O" do
      @game.board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @player_1.stub(:make_move).and_return(0)
      @game.play
      
      @game.board.grid[0].should == 'O'
    end

    it "plays a move for X" do
      @game.board.grid = [
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
