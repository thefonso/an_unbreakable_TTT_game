require 'windetection'
require 'board'

class Test_WinDetection
  include WinDetection
end

describe "Windetection module" do
  context "is_a_human_win" do
    it "detects a win for X" do
      detect  = Test_WinDetection.new
      board = [
        "+", "X", "+",
        "+", "X", "+",
        "+", "X", "+"
      ]
      detect.three_in_a_row_win?(board,'X').should be_true
    end
    it "detects a win for O" do
      detect  = Test_WinDetection.new
      board = [
        "+", "O", "+",
        "+", "O", "+",
        "+", "O", "+"
      ]
      detect.three_in_a_row_win?(board,'O').should be_true
    end

  end
end
