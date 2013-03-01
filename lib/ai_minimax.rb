require 'facets'
require_relative 'windetection'
require 'pry'

class Minmax 
    include WinDetection

    attr_accessor :i
    
    def initialize
      @i = 0
    end

    def minmax(board, player)
      if board.grid == ["+", "+", "+", "+", "+", "+", "+", "+", "+"]
        first_move
      else
        scores_hash = score_the_boards(board, player)
        max_hash = find_max_board(scores_hash)
        min_hash = find_min_board(scores_hash)
        answers = (max_hash.to_a - min_hash.to_a)
        intersect = Hash[*answers.flatten]
        max_move = intersect.select{|k,v| v == 'O'}.keys[0]
        min_move = intersect.select{|k,v| v == 'X'}.keys[0]
        return max_move
      end
    end

    def find_max_board(scores_hash)
        max_board = scores_hash.max_by{|k,v| v}[0]
        # # p"Max board "+max_board.to_s
        max_hash = {}
        max_board.each_with_index{|item, index| max_hash[index] = item}
      
        # p"max_hash "+max_hash.to_s
        return max_hash
    end

    def find_min_board(scores_hash)
        min_board = scores_hash.min_by{|k,v| v}[0]
        # puts "Min board "+min_board.to_s
        min_hash = {}
        min_board.each_with_index{|item, index| min_hash[index] = item}
      
        # p"min_hash "+min_hash.to_s
        return min_hash
    end
    
    def first_move
      start_moves = [0, 2, 4, 6, 8].sample
    end

    def score_the_boards(board, player_symbol)
      @count = 0
      ply = 0
      @i = 0
      test_boards_hash = {}
      test_boards_hash = generate_boards(board, player_symbol)
      scores_hash = {}
      test_boards_hash.each do |_, board|
        if three_in_a_row_win?(board, player_symbol) != nil 
          if three_in_a_row_win?(board, 'O') == true
            scores_hash[board] = (1000 - ply)
          elsif three_in_a_row_win?(board, 'X') == true
            scores_hash[board] = (-1000 + ply)
          else
            scores_hash[board] = 0
          end
        else
          puts 'D R A W'
        end

        ply -= 5
      end
      return scores_hash
    end


    def generate_boards(board, player)
      @virtual_board_hash ||= {}
      virtual_board = board.dup
      empty_spaces = []

      virtual_board.grid.size.times do |empty|
        if virtual_board.grid[empty] == '+'
          empty_spaces << empty
        end
      end

      empty_spaces.each do |space|
        cloned_board = Board.new
        cloned_board.grid = board.grid.clone

        if player == "O"
          new_board = move_as_somebody(cloned_board, "X", space)
          new_player = "X"
          @virtual_board_hash[@i] = new_board.grid
        else
          new_board = move_as_somebody(cloned_board, "O", space)
          new_player = "O"
          @virtual_board_hash[@i] = new_board.grid
        end

        generate_boards(new_board, new_player)
      end

      return @virtual_board_hash
    end


    def move_as_somebody(board, player, empty_space)
      board.grid[empty_space] = player
      @i+=1
      return board
    end

    def draw?(grid)
      grid.none? { |mark| mark == '+' }
    end

    def switch_player(player_symbol)
      player_symbol == 'X' ? 'O' : 'X'
    end

    def score(board, player_symbol, position)
      newboard = move_as_somebody(board, player_symbol, position)
      opponent = switch_player(player_symbol)

      if three_in_a_row_win?(newboard.grid, player_symbol)
        return 1
      elsif three_in_a_row_win?(newboard.grid, opponent)
        return -1
      elsif draw?(newboard.grid)
        return 0
      end

      best_score = -1
      empty_spaces = []
      newboard.grid.each_with_index do |mark, index|
        if mark == '+'
          empty_spaces << index
        end
      end

      empty_spaces.each do |space|
        opponent_score = score(newboard,opponent,space)
        if opponent_score * -1 > best_score
          best_score = opponent_score * -1
        end
      end
      return best_score
    end
end
