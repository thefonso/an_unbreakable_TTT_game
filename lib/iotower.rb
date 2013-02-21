require 'game'
require 'board'
require 'iodrawbridge'

board = Board.new

class IOtower
  def initialize(drawbridge = IOdrawbridge.new)
    @drawbridge = drawbridge
  end

  def display_message_start
    @drawbridge.put_output("Welcome to TTT get ready to play!")
  end

  def display_message_end
    @drawbridge.put_output("Game Over")# TODO - find result... win or draw
  end

  def display_message_and_get_move(who_i_am)
    if who_i_am == 'human'
      human_move_message
      @drawbridge.get_input.to_i
    else
      ai_move_message
      @drawbridge.get_input.to_i
    end
  end

  def human_gamepiece
    put_output("Enter a gamepiece you want to be 'X' or 'O'")
    @drawbridge.get_input.to_s
  end

  def human_move_message
    @drawbridge.put_output("Human move...")
  end

  def ai_move_message
    @drawbridge.put_output("AI move...")
  end

  def redraw_board(grid)
    board = "\n"
    board << " #{grid[0]} | #{grid[1]} | #{grid[2]}\n"
    board << "-----------\n"
    board << " #{grid[3]} | #{grid[4]} | #{grid[5]}\n"
    board << "-----------\n"
    board << " #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end

end
