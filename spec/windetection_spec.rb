require 'windetection'
require 'board'
require 'pry'

class Test_WinDetection
  include WinDetection
end

describe "Windetection module" do
  before (:each) do
    @board = Board.new
  end
  context "win? method" do
    it "should indicate a win" do
      detect = Test_WinDetection.new     
      @board = [
        "+", "X", "+",
        "+", "X", "+",
        "+", "X", "+"
      ]
      detect.win?(@board).should be_true   
    end
    it "should indicate a draw" do
      detect = Test_WinDetection.new     
      @board = [
        "O", "X", "O",
        "O", "X", "X",
        "X", "O", "O"
      ]
      detect.draw?(@board).should be_true  
    end
  end
  context "three_in_a_row method" do
    it "detects a win for X" do
      detect  = Test_WinDetection.new
      @board = [
        "+", "X", "+",
        "+", "X", "+",
        "+", "X", "+"
      ]
      detect.three_in_a_row_win?(@board,'X').should be_true
    end
    it "detects a win for O" do
      detect  = Test_WinDetection.new
      @board = [
        "+", "O", "+",
        "+", "O", "+",
        "+", "O", "+"
      ]
      detect.three_in_a_row_win?(@board,'O').should be_true
    end

  end
end
