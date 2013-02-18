require 'game'
require 'board'

describe 'Game class' do
 # before (:each) do
 #   @board = Board.new
 #   @player_1 = player_1.new
 #   @player_2    = player_2.new
 #   @player_1 = @player_1
 #   @player_2 = @player_2
 #   @game  = Game.new(@player_1, @player_2, @board)
 # end
 #
 # it 'should display game board state' do
 #   @board.should_receive(:printgrid)
 #   @game.drawgrid
 # end

  before(:each) do
    @player_1 = 'O'
    @player_2 = 'X'
  end

  context "valid_move?" do
    it 'is true if board is empty' do
      board = Board.new
      board.grid = [
        '+', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      game = Game.new(@player_1, @player_2, board)
      game.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      board = Board.new
      board.grid = [
        '0', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      game = Game.new(@player_1, @player_2, board)
      game.valid_move?(0).should be_false
    end
  end

  context "over?" do
    it 'is false if board is empty' do
      board = Board.new
      board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      game = Game.new(@player_1, @player_2, board)
      game.over?.should be_false
    end

    it 'is false if board is not full' do
      board = Board.new
      board.grid = [
         'O', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      game = Game.new(@player_1, @player_2, board)
      game.over?.should be_false
    end

    it 'is true if board is full' do
      board = Board.new
      board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]
      
      game = Game.new(@player_1, @player_2, board)
      game.over?.should be_true
    end
  end

  context "play_move" do
    it "plays a move for O" do
      board = Board.new
      board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      game = Game.new(@player_1, @player_2, board)
      game.play_move(0)
      
      game.board.grid[0].should == 'O'
    end

    it "plays a move for X" do
      board = Board.new
      board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      game = Game.new(@player_1, @player_2, board)
      game.play_move(0)
      game.play_move(1)
      
      game.board.grid[0].should == 'O'
      game.board.grid[1].should == 'X'
    end
  end
end


