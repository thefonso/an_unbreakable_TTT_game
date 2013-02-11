require 'human'
require 'board'

describe 'Human class' do
  it 'should receive a board' do
    board = Board.new
    human = Human.new
    human.makes_move(board).should == "bob"
  end
end

