require 'board'
require 'minimax'

RSpec::Matchers.define :be_one_of do |list|
  match do |actual|
    list.include?(actual)
  end
end


describe Minimax do
  before (:each) do
    @player = "X"
    @count = 0
    @ply = 2
    @board = Board.new
    @minimax = Minimax.new
    @minimax.i = 0

    @board.grid=["O","O","X",
                 "X","X","+",
                 "+","+","+"]
  end

  let(:corner_moves) {[0,2,6,8]}
  let(:cross_moves) {[1,3,5,7]}

  context 'get_move method' do

    it 'should return optimal first move when AI is first' do
      @board.grid = ["+","+","+",
                     "+","+","+",
                     "+","+","+"]

      @minimax.get_move(@board,@player).should == 4
    end

    it 'should return defensive first move when AI is second and first player selected the center' do
      @board.grid = ["+","+","+",
                     "+","O","+",
                     "+","+","+"]

      expect(@minimax.get_move(@board,@player)).to be_one_of(corner_moves)
    end

    it 'should return defensive first move when AI is second and first player did not select the center' do
      @board.grid = ["O","+","+",
                     "+","+","+",
                     "+","+","+"]

      @minimax.get_move(@board,@player).should be_one_of(cross_moves) 
    end

    it 'should give a winning move' do
      @board.grid=["X","+","+",
                   "O","+","+",
                   "+","+","X"]

      @minimax.get_move(@board, @player).should == 4
    end

    it 'should return a blocking move' do
      @board.grid=["O","+","+",
                   "X","O","+",
                   "+","+","+"]

      @minimax.get_move(@board, @player).should == 8
    end

    it 'should defend against split one' do
      @board.grid=["O","+","+",
                   "+","X","+",
                   "+","O","+"]

      @minimax.get_move(@board, @player).should == 3
    end
    it 'should defend against split two' do
      @board.grid=["+","O","+",
                   "+","X","+",
                   "O","+","+"]

      @minimax.get_move(@board, @player).should == 0
    end
    it 'should defend against split three' do
      @board.grid=["+","+","O",
                   "+","+","+",
                   "+","+","+"]

      @minimax.get_move(@board, @player).should be_one_of([1,3,5,7])
    end
    it 'should defend against human first move' do
      @board.grid=["+","+","+",
                   "+","+","+",
                   "+","O","+"]

      expect(@minimax.get_move(@board, @player)).to be_one_of([3,4,5,6,8])
    end

    it 'should place last move board' do
      @board.grid=["X","O","O",
                   "X","O","+",
                   "O","X","X"]

      @minimax.get_move(@board, @player).should == 5
    end
    it 'should place not break' do
      @board.grid=["X","X","O",
                   "O","O","X",
                   "X","+","+"]

      @minimax.get_move(@board, @player).should be_a_kind_of(Integer) 
    end
  end
end
