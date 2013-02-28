require 'facets'
require_relative 'windetection'
require 'pry'

module Algorithm
  module Minimax 
    include WinDetection

    def minmax(board,player)
      #p 'original board '+board.grid.to_s
      allboards = score_the_boards(board, player)
      p 'allboards '+allboards.to_s
      max_board = allboards.max_by{|k,v| v}[0]
      puts "Max board "+max_board.to_s

      min_board = allboards.min_by{|k,v| v}[0]
      puts "Min board "+min_board.to_s

      values = (0..8).to_a
      puts "values "+values.to_s

      max_hash = Hash[max_board.zip values]
      puts "max_hash "+max_hash.to_s

      # min_board = allboards.min_by{|k,v| v}[0]
      # p "Min board "+min_board.to_s
      # convert arrays to hashes?
      #
      # answers = (max_board - min_board).flatten
      # p 'answers '+answers.to_s

      # intersect = Hash[*answers.flatten]
      # p 'intersect '+intersect.to_s

      # p max_move = intersect.select{|k,v| v == 'O'}.keys[0]
      #p min_move = intersect.select{|k,v| v == 'X'}.keys[0]
    end

    def score_the_boards(board, player_symbol)
      @count = 0
      ply = 0
      @i = 0
      test_boards_hash = {}
      test_boards_hash = generate_boards(board, player_symbol)
      # p "test_boards_hash "+test_boards_hash.to_s
      # convert array to hash
      scores_hash = {}
      test_boards_hash.each do |key, value|
        if three_in_a_row_win?(value, player_symbol) != nil 
          if three_in_a_row_win?(value, 'O') == true
            scores_hash[value] = (1000 - ply)
          elsif three_in_a_row_win?(value, 'X') == true
            scores_hash[value] = (-1000 + ply)
          else
            scores_hash[value] = 0 #no value
            #p scores_hash[test_board] 
          end
        else
          puts 'D R A W'
        end
        ply -= 5
      end
      # p "SCORES HASH "+scores_hash.to_s
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
      #p "vb hash "+@virtual_board_hash.to_s
      return @virtual_board_hash
    end


    def move_as_somebody(board, player, empty_space)
      board.grid[empty_space] = player
      @i+=1
      return board
    end

  end
end
