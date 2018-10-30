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
    @moves = []
  end
  
  def growth(start_pos, dir)
    start_row, start_col = start_pos
    grow_row, grow_col = dir
    [(start_row + grow_row), (start_col + grow_col)]
  end
  
end

module SlidingPiece
  
  def moves(start_pos, move_dirs)
    @moves = []
    dir_array.each do |dir|
      @moves.concat(grow(start_pos, dir))
    end
    @moves
  end
  
  # def diagonal_moves(start_pos)
  #   @moves = []
  #   DIAGONAL_DIRS.each do |dir|
  #     @moves.concat(grow(start_pos, dir))
  #   end
  #   @moves
  # end
  
  
  
  def grow(start_pos, dir)
    check_pos = growth(start_pos, dir)
    growth_moves = []
    until @board[check_pos] != NullPiece #|| check_pos[0] > 7 || check_pos[1] > 7
      growth_moves << check_pos
      check_pos = growth(check_pos, dir)
    end
    # if @board[check_pos].color != player.color
    #   growth_moves << check_pos
    # end
  end
  
  
  
  
  def blocked?(arr)
  end
  
end 

module SteppingPiece
  KNIGHT_DIRS = [[2,1], [2,-1], [1,2], [1,-2], [-2,1], [-2,-1], [-1,2], [-1,-2]]
  
  def moves(start_pos, move_dirs)
    @moves = []
    dir_array.each do |dir|
      @moves.concat(grow(start_pos, dir))
    end 
    @moves
  end
  
  # def diagonal_moves(start_pos)
  #   @moves = []
  #   DIAGONAL_DIRS.each do |dir|
  #     @moves.concat(grow(start_pos, dir))
  #   end
  #   @moves
  # end
  
  def grow(start_pos, dir)
    check_pos = growth(start_pos, dir)
    growth_moves = []
    growth_moves << check_pos #unless board[check_pos].color == player.color
  end 
  
  
end


class Rook < Piece
  include SlidingPiece
  
  def initialize(color, board, pos = [0, 0])
    super
    
  end
  
  def symbol
    return "♜" if self.color == :black
    return "♖" if self.color == :white
  end
  
  def move_dirs
    HORIZONTAL_DIRS
  end
  

end


class Knight < Piece 
  include SteppingPiece
  
  def initialize(color, board, pos = [1, 0])
    super 
  end 
  
  def symbol
    return "♞" if self.color == :black
    return "♘" if self.color == :white
  end
  
  def move_dirs
    KNIGHT_DIRS
  end
  
  def moves 
   
  end
  
end 

class Bishop < Piece
  include SlidingPiece
  def initialize(color, board, pos = [2, 0])
    super
    
  end
  
  def symbol
    return "♝" if self.color == :black
    return "♗" if self.color == :white
  end
  
  def move_dirs
    DIAGONAL_DIRS
  end
  
  def moves
    @moves = []
  end 
end

class Queen < Piece
  include SlidingPiece
  def initialize(color, board, pos = [3, 0])
    super
    
  end
  
  def symbol
    return "♛" if self.color == :black
    return "♕" if self.color == :white
  end
  
  def move_dirs
    HORIZONTAL_DIRS.concat(DIAGONAL_DIRS)
  end
  
  def moves
    @moves = []
  end 
end

class King < Piece
  include SteppingPiece
  
  def initialize(color, board, pos = [4, 0])
    super
    
  end
  
  def symbol
    return "♚" if self.color == :black
    return "♔" if self.color == :white
  end 
  
  def move_dirs
    HORIZONTAL_DIRS.concat(DIAGONAL_DIRS)
  end
  
  def moves
    @moves = []
  end 
end

class Pawn < Piece
  def initialize(color, board, pos = [0, 1])
    super
    
  end
  
  def symbol
    return "♟" if self.color == :black
    return "♙" if self.color == :white
  end 
  
  def moves
    @moves = []
  end 
end

class NullPiece < Piece 
  include Singleton
  def initialize
    #@type = nil
  end
  
  # def inspect
  #   print "E"
  # end
  
  def symbol
    "."
  end
  
end