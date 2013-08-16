require 'windetection'

#TODO -  finish win|draw game output for this branch
# then switch to experimental branch and refactor this class
#
# each unfinished board is a branch
# the score of that node is a combo of all
# the scores for the subsequently derived boards.
#

class Minimax
  include WinDetection

  attr_accessor :i

  def initialize
    @i   = 0
  end

  def get_move(board, player_symbol)
    cloned_board = board.grid.clone

    return first_move(cloned_board,player_symbol) if first_move?(cloned_board,player_symbol)

    get_best_move(cloned_board, player_symbol)
  end

  private

  def get_best_move(board, player_symbol)
    opponent = switch_player(player_symbol)

    empty_spaces_on_board(board).each do |space|
      @cloned_board = board.clone
      @cloned_board[space] = player_symbol

      @enemy_board = board.clone
      @enemy_board[space] = opponent

      if three_in_a_row_win?(@cloned_board, player_symbol)
        return  space
      elsif three_in_a_row_win?(@enemy_board, opponent)
        return space
      elsif draw?(@cloned_board)
        return space
      end
    end

    get_best_move(@cloned_board, switch_player(player_symbol))
  end

  def first_move?(board, player_symbol)
    if board.count(player_symbol) == 0
      true
    else
      false
    end
  end

  def first_move(board,player_symbol)
    opponent = switch_player(player_symbol)
    enemy_index = board.index(opponent)
    if enemy_index == 4
      return [0,2,6,8].sample
    elsif enemy_index != 4
      return 4
    end
  end

  def empty_spaces_on_board(board)
    Hash[(0...board.size).zip board].select { |k, v| v == '+' }.keys
  end

  def draw?(board)
    board_array = board
    board_array.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
