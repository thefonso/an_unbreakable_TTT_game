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

    cloned_board = board.clone

    return first_move if first_move?(board)

    cloned_boards_hash = Hash.new

    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
#    binding.pry
    #
    opponent = switch_player(player)

    empty_spaces.each do |space|
      if score_a_move(cloned_board.grid, player, space ) == 1
        return space
      elsif score_a_move(cloned_board.grid, opponent, space ) == 1
        return space
      end
    end
  end

  def score_a_move(board, player_symbol, empty_space)
    opponent = switch_player(player_symbol)
    cloned_boards_hash = Hash.new

    i=0
    cloned_again_board = board.clone
    cloned_again_board[empty_space] = player_symbol
    cloned_boards_hash[i] = cloned_again_board

    enemy_board = board.clone
    enemy_board[empty_space] = opponent
    cloned_boards_hash[i+=1] = enemy_board
    #binding.pry

    #TODO create look ahead
    #look_ahead_board = move_as_somebody(board,player_symbol,empty_space)
    board_hash = Hash[(0...enemy_board.size).zip enemy_board]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 

    if three_in_a_row_win?(cloned_again_board, player_symbol)
      return 1
    elsif three_in_a_row_win?(enemy_board, opponent)
      return -1
    elsif draw?(board)
      return 0
    else
      empty_spaces.each do |space|
        look_ahead_score = score_a_move(enemy_board, opponent, space)
        #binding.pry
        if look_ahead_score == 1
          return look_ahead_score
        elsif look_ahead_score == -1
          look_ahead_score = look_ahead_score * -1
          return look_ahead_score
        end
      end
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
