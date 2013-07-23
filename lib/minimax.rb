require 'facets'
require_relative 'windetection'
require 'pry'

class Minimax 
  include WinDetection

  attr_accessor :i

  def initialize
    @i = 0
  end

  def first_move
    start_moves = [0, 2, 4, 6, 8].sample
    return start_moves
  end

  def first_move?(board)
    board == ["+", "+", "+", "+", "+", "+", "+", "+", "+"]
  end

  def get_move(board, player)
    # return best move
    cloned_board = board.grid.clone

    return first_move if first_move?(board)
    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys  
    answers = Array.new

    empty_spaces_on_board.each do |space|
      if score_a_move(cloned_board,player)[0] === 1
        #return score_a_move(cloned_board,player)[1]
        answers << score_a_move(cloned_board,player)[1]
      elsif score_a_move(cloned_board,player)[0] === -1
        #return score_a_move(cloned_board,player)[1]
        answers << score_a_move(cloned_board,player)[1]
      end
      binding.pry
      #return space
    end 
  end

  def score_a_move(board, player_symbol)
    # find best move
    opponent = switch_player(player_symbol)
    next_boards         = Array.new
    answers             = Array.new

    if draw?(board)
      return 0
    else
      ply=0
      #find all empty spaces on board 
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
          next_boards << @enemy_board
          ply+=1
        end
      end

      if ply > 0
        next_boards.each do |nextboard|
          # nextboard
          answers << score_a_board(nextboard, player_symbol)
        end
      end
      binding.pry

    end
  end

  def score_a_board(board, player_symbol)
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
