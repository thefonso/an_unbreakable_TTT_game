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

  def get_move(board, player_symbol)
    board = board.grid
    opponent = switch_player(player_symbol)
    next_boards               = Array.new
    answers                   = Array.new

    if draw?(board)
      return 0
    else
      ply=0
      board_hash = Hash[(0...board.size).zip board]
      empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys 

      empty_spaces_on_board.each do |space|

        @cloned_board = board.clone
        @cloned_board[space] = player_symbol

        @enemy_board = board.clone
        @enemy_board[space] = opponent

        if three_in_a_row_win?(@cloned_board, player_symbol) #max
          return  space
        elsif three_in_a_row_win?(@enemy_board, opponent)    #min
          return  space
        else
          next_boards << @enemy_board
          ply+=1
        end
      end

      if ply > 0
        next_boards.each do |nextboard|
          answers << score_a_board(nextboard, player_symbol)
        end
        binding.pry
        space =  answers.detect{|element| answers.count(element) > 1}[1]
        return space
      end

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
