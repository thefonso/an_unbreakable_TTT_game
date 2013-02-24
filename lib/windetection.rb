module WinDetection
  #TODO - abstract this out so method detects win 'is_a_win(board,player_symbol)'
  def is_a_human_win(board)
    grid = board
    win_moves = [
      ["X", " ", " ",
       "X", " ", " ",
       "X", " ", " "
      ],
      [" ", "X", " ",
       " ", "X", " ",
       " ", "X", " "
      ],
      [" ", " ", "X",
       " ", " ", "X",
       " ", " ", "X"
      ],
      ["X", " ", " ",
       " ", "X", " ",
       " ", " ", "X"
      ],
      [" ", " ", "X",
       " ", "X", " ",
       "X", " ", " "
      ],
      ["X", "X", "X",
       " ", " ", " ",
       " ", " ", " "
      ],
      [" ", " ", " ",
       "X", "X", "X",
       " ", " ", " "
      ],
      [" ", " ", " ",
       " ", " ", " ",
       "X", "X", "X"
      ]
    ]

    win_moves.any? {|winning_move| winning_move == grid }

  end

  def is_a_computer_win(board)
    grid = board
    win_moves = [
      ["O", " ", " ",
       "O", " ", " ",
       "O", " ", " "
      ],
      [" ", "O", " ",
       " ", "O", " ",
       " ", "O", " "
      ],
      [" ", " ", "O",
       " ", " ", "O",
       " ", " ", "O"
      ],
      ["O", " ", " ",
       " ", "O", " ",
       " ", " ", "O"
      ],
      [" ", " ", "O",
       " ", "O", " ",
       "O", " ", " "
      ],
      ["O", "O", "O",
       " ", " ", " ",
       " ", " ", " "
      ],
      [" ", " ", " ",
       "O", "O", "O",
       " ", " ", " "
      ],
      [" ", " ", " ",
       " ", " ", " ",
       "O", "O", "O"
      ],
    ]

    win_moves.any? {|winning_move| winning_move == grid }

  end

end

