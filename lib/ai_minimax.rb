require 'facets'
require_relative 'windetection'
require 'pry'

class Minmax 
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

  def minmax(board, player)
    # return best move
    cloned_board = board.clone

    return first_move if first_move?(board)
    
    score_a_move(cloned_board,player)

  end

  def score_a_move(board, player_symbol)
  # find best move
    
    opponent = switch_player(player_symbol)
    player_boards_hash = Hash.new
    enemy_boards_hash = Hash.new

    if draw?(board)
      return 0
    else
      #find all empty spaces on board 
      board_hash = Hash[(0...board.size).zip board]
      empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys 
      # binding.pry

      empty_spaces_on_board.each do |space|
        ply=0
        @cloned_board = board.clone
        @cloned_board[space] = player_symbol
        player_boards_hash[ply] = @cloned_board

        @enemy_board = board.clone
        @enemy_board[space] = opponent
        enemy_boards_hash[ply] = @enemy_board
        ply+=1

        if three_in_a_row_win?(@cloned_board, player_symbol)
          return space
        elsif three_in_a_row_win?(@enemy_board, opponent)
          return space
        end
      end
       score_a_move(@enemy_board,player_symbol)
    end
  end

  def move_as_somebody(board, player, empty_space)
    board[empty_space] = player
    @i+=1 # TODO forgot why this is here....why is this here?
    return board
  end

  def generate_nextboard(board,player)
    cloned_board = board.clone
    space = nil
    cloned_again_board = Board.new
    board_hash = Hash[(0...cloned_board.grid.size).zip cloned_board.grid]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
    #binding.pry

    space = empty_spaces[0]
    cloned_again_board = move_as_somebody(cloned_board, switch_player(player), space)
    #binding.pry

    return cloned_again_board
  end

  def draw?(board)
    # binding.pry
    board_array = board
    board_array.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
