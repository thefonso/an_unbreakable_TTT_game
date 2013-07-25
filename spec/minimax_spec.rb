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

  context 'first_move' do
    it 'should take optimal first move' do
      @board=["+","+","+",
              "+","+","+",
              "+","+","+"]
      @minimax.first_move(@board,@player).should == 4
    end
    it 'should take defensive first move' do
      @board=["+","+","+",
              "+","O","+",
              "+","+","+"]
      expect(@minimax.first_move(@board,@player)).to be_one_of([0,1,2,3,5,6,7,8])
    end
    it 'should take defensive first move' do
      @board=["O","+","+",
              "+","+","+",
              "+","+","+"]
      @minimax.first_move(@board,@player).should == 4
    end
  end
  
  context 'first_move?' do
    it 'should return true' do
      ply = 0
      @board=["+","+","+",
              "+","+","+",
              "+","+","+"]

      @minimax.first_move?(@board,@player).should == true
    end
    it 'should return false' do
      ply = 1
      @board=["+","+","+",
              "+","+","+",
              "+","X","O"]

      @minimax.first_move?(@board,@player).should == false
    end
  end

  context 'get_move method' do
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

      @minimax.get_move(@board, @player).should == 6
    end
    it 'should defend against split two' do
      @board.grid=["+","O","+",
                   "+","X","+",
                   "O","+","+"]

      @minimax.get_move(@board, @player).should == 0
    end
    it 'should defend against human first move' do
      @board.grid=["+","+","+",
                   "+","+","+",
                   "+","O","+"]

      expect(@minimax.get_move(@board, @player)).to be_one_of([3,4,5,6,8])
      # [3,4,5,6,8].include?( @minimax.get_move(@board, @player)  ).should == true
      #@minimax.get_move(@board, @player).should satisfy {|s| [3,4,5,6,8].include?(s)}
    end

    it 'should place last move board' do
      @board.grid=["X","O","O",
                   "X","O","+",
                   "O","X","X"]

      @minimax.get_move(@board, @player).should == 5
    end
  end
end

