require "singleton"

class Piece
  HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]
  attr_accessor :pos
  attr_reader :symbol, :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
  def moves
    possible_moves = []
    move_dirs.each do |dir|
      possible_moves.concat(grow(pos, dir))
    end 
    possible_moves
  end
  
  def growth(start_pos, dir)
    start_row, start_col = start_pos
    grow_row, grow_col = dir
    [(start_row + grow_row), (start_col + grow_col)]
  end
  
end

module SlidingPiece
  
  def grow(pos, dir)
    check_pos = growth(pos, dir)
    growth_moves = []
    while @board[check_pos].is_a?(NullPiece) 
      growth_moves << check_pos
      check_pos = growth(check_pos, dir)
    end
    # if @board[check_pos].color != player.color
    #   growth_moves << check_pos
    # end
    growth_moves
  end
  
end 

module SteppingPiece
  KNIGHT_DIRS = [[2,1], [2,-1], [1,2], [1,-2], [-2,1], [-2,-1], [-1,2], [-1,-2]]
  
  def grow(start_pos, dir)
    check_pos = growth(start_pos, dir)
    growth_moves = []
    growth_moves << check_pos if @board[check_pos].is_a?(NullPiece)
    growth_moves #unless board[check_pos].color == player.color
  end 

end

class NullPiece < Piece 
  include Singleton
  def initialize
  end

  def symbol
    "."
  end
  
end