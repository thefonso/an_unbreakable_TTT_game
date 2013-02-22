require 'config'

describe 'Configfile class' do
  it 'should return an array' do
    pieces = Configfile.pieces
    pieces.should == ['X', 'O']
  end
end
