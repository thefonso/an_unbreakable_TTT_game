require 'facets'
require_relative 'windetection'
require 'pry'

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

  def first_move(board,player_symbol)
    opponent = switch_player(player_symbol)
    enemy_index = board.index(opponent)
    if enemy_index == 4
      return [0,1,2,3,5,6,7,8].sample
    elsif enemy_index != 4
      return 4
    end
  end

  def first_move?(board, player_symbol)
    if board.count(player_symbol) == 0 
      true
    else
      false
    end
  end

  def get_move(board, player_symbol)
    cloned_board = board.grid.clone

    return first_move(cloned_board,player_symbol) if first_move?(cloned_board,player_symbol)

    if score_a_move(cloned_board,player_symbol)[0] == 1
      return score_a_move(cloned_board,player_symbol)[1]
    elsif score_a_move(cloned_board,player_symbol)[0] == -1
      return score_a_move(cloned_board,player_symbol)[1]
    end
  end

  def score_a_move(board, player_symbol)
    answers             = Array.new
    next_branch         = Array.new
    opponent = switch_player(player_symbol)

    if draw?(board)
      return 0
    else
      board_hash = Hash[(0...board.size).zip board]
      empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys 

      empty_spaces_on_board.each do |space|

        @cloned_board = board.clone
        @cloned_board[space] = player_symbol

        @enemy_board = board.clone
        @enemy_board[space] = opponent

        if three_in_a_row_win?(@cloned_board, player_symbol)
          return  1, space
        elsif three_in_a_row_win?(@enemy_board, opponent)
          return -1, space
        else
          next_branch << @enemy_board
        end
      end

      next_branch.each do |nextboard|
        if score_a_move(nextboard, player_symbol)[0] == -1
          return -1, score_a_move(nextboard, player_symbol)[1] 
        end
      end

    end
  end

  def draw?(board)
    board_array = board
    board_array.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
