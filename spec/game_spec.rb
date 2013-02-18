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

  context "play_move" do
    it "plays a move for O" do
      @board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.play_move(0)
      
      @game.board.grid[0].should == 'O'
    end

    it "plays a move for X" do
      @board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.play_move(0)
      @game.play_move(1)
      
      @game.board.grid[0].should == 'O'
      @game.board.grid[1].should == 'X'
      
    end
  end    

  context "play" do
    it "calls the get_human_move method which returns a human move" do
      #stub a human move here
      $stdin.stub(:gets).and_return(1)
      @game.play.should_not be_nil
    end
  end

  context "get_human_move" do
    it "returns a human move" do
      $stdin.stub(:gets).and_return(1)
      # should retrun type of interger
      @game.get_human_move.should be_a_kind_of(Integer)
    end
  end


end


