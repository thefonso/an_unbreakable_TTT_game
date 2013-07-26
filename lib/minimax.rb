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
    @ply = 0
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
    # return best move
    cloned_board = board.grid.clone

    return first_move(cloned_board,player_symbol) if first_move?(cloned_board,player_symbol)

    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys  

    empty_spaces_on_board.each do |space|
      if score_a_move(cloned_board,player_symbol,@ply) != nil
        if score_a_move(cloned_board,player_symbol,@ply)[0] === 1
          return score_a_move(cloned_board,player_symbol,@ply)[1]
        elsif score_a_move(cloned_board,player_symbol,@ply)[0] === -1
          return score_a_move(cloned_board,player_symbol,@ply)[1]
        end
      else
        return space
      end
    end 
  end

  def score_a_move(board, player_symbol, ply)
    answers             = Array.new
    next_boards         = Array.new

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
        end
        next_boards << @enemy_board
      end
      ply+=1
    end

    if ply > 0
      next_boards.each do |nextboard|
        answers << score_a_board(nextboard, player_symbol, ply)
      end
      return answers.detect{|element| answers.count(element) > 1}
    end
  end

  def score_a_board(board, player_symbol, ply)

    next_boards         = Array.new

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
        end
        next_boards << @enemy_board
      end
      ply+=1
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
