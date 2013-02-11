require 'board'

describe 'Board class' do
  it 'should have an empty grid' do
    board = Board.new

    board.grid.should == [
      ['+', '+', '+'],
      ['+', '+', '+'],
      ['+', '+', '+']
    ]
  end

  it 'should play a move' do
    board = Board.new

    board.play_move(0, 0, 'o')

    board.grid.should == [
      ['o', '+', '+'],
      ['+', '+', '+'],
      ['+', '+', '+']
    ]
  end
end
