require 'windetection'
require 'board'

class Test_WinDetection
  include WinDetection
end

describe "Windetection module" do
  context "is_a_human_win" do
    it "receives a board" do
      detect  = Test_WinDetection.new
      board   = "bob" 
      detect.is_a_human_win(board).should == "bob"
    end
  end
end
