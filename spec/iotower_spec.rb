require 'iotower'
require 'human'
require 'ai'

describe 'IOtower class' do
  before (:each) do
    @io = IOtower.new
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  
  context "display_message_start" do
    it 'should display a welcome message'do
      @io.display_message_start.should == "Welcome to TTT get ready to play!" 
    end
  end

  context "display_messgae_end" do
    it 'should display Game Over message' do
      @io.display_message_end.should == "Game Over" 
    end
  end

  context "message" do
    it 'should display human message if human is received' do
      @io.message('human').should == 'Human move...'
    end
    
    it 'should display ai message if ai = who_i_am' do
      @io.message('ai').should == 'AI move...'
    end
  end

  context "human_move_message" do
    it 'should display human message if human = who_i_am' do
      @io.human_move_message.should == 'Human move...'
    end
  end

  context "ai_move_message" do
    it 'should display ai message if ai = who_i_am' do
      @io.ai_move_message.should == 'AI move...'
    end
  end

  context "redraw_board" do
    it 'should redraw the game board to the interface' do
      board = Board.new 
      @io.redraw_board(board.grid).should == <<-EOF.gsub(/^ {6}/, '')

       + | + | +
      -----------
       + | + | +
      -----------
       + | + | + 
    EOF
    end
  end

end
