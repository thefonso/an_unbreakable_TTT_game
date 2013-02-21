require 'board'

describe 'Board class' do
  before (:each) do
    @board = Board.new
  end
  context 'initialize' do
    it 'should have an empty grid' do

      @board.grid.should == [
        '+', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]
    end
  end

  context 'play_move' do
    it 'should play a move' do

      @board.play_move(0, 'o')

      @board.grid.should == [
        'o', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]
    end
  end

  context 'printgrid' do
    it 'should display the board on standard output' do
      board = Board.new
      board.printgrid.should == <<-EOF.gsub(/^ {6}/, '')

       + | + | +
      -----------
       + | + | +
      -----------
       + | + | + 
    EOF
    end
  end
end
