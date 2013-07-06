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

    return first_move if first_move?(board)

    cloned_board = board.clone
  binding.pry 
    opponent = switch_player(player)

    if draw?(board)
      return 0
    else
      i=0
      board_hash = Hash[(0...board.grid.size).zip board.grid]
      empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
      empty_spaces.each do |space|

        #TODO
        #clone the board
        #place move on board
        #return board
        cloned_again_board = move_as_somebody(cloned_board, switch_player(player), space)

        binding.pry

        if score_a_move(cloned_board, player, space) == 1
          return space
        elsif score_a_move(cloned_board, opponent, space) == 1
          return space
        else
          minmax(cloned_again_board, player)
        end
        i += 1
      end

    end
  end

  def score_a_move(board, player_symbol, empty_space)

    opponent = switch_player(player_symbol)

    if three_in_a_row_win?(board.grid, player_symbol)
      return 1
    elsif three_in_a_row_win?(board.grid, opponent)
      return -1
    else
      return 0
    end

  end

  def move_as_somebody(board, player, empty_space)
    board.grid[empty_space] = player
    @i+=1 # TODO forgot why this is here....why is this here?
    return board
  end
  
  def look_ahead(board,player)
    cloned_hash = Hash.new

    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
    empty_spaces.each do |space|
      cloned_again_board = move_as_somebody(cloned_board, switch_player(player), space)
    end
  end

  def draw?(board)
    # binding.pry
    board_array = board.grid
    board_array.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
