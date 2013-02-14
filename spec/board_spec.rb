require 'board'

describe 'Board class' do
  before (:each) do
    @board = Board.new
  end
  it 'should have an empty grid' do

    @board.grid.should == [
      '+', '+', '+',
      '+', '+', '+',
      '+', '+', '+'
    ]
  end

  it 'should play a move' do

    @board.play_move(0, 'o')

    @board.grid.should == [
      'o', '+', '+',
      '+', '+', '+',
      '+', '+', '+'
    ]
  end

  it 'should display the board on standard output' do
    board = Board.new
    board.printgrid.should == <<-EOF.gsub(/^ {6}/, '')
    
        | |  
     ----------
        | |  
     ----------
        | |  
    EOF
  end
end
