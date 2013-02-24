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
        " ", "X", " ",
        " ", "X", " ",
        " ", "X", " "
      ]
      detect.is_a_human_win(board).should be_true
    end
    it "detects a win for O" do
      detect  = Test_WinDetection.new
      board = [
        " ", "O", " ",
        " ", "O", " ",
        " ", "O", " "
      ]
      detect.is_a_computer_win(board).should be_true
    end

  end
end
