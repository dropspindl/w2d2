require_relative 'piece.rb'

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
    possible_moves = []
    if self.color == :white
      if growth(pos, [0,1]).is_a?(NullPiece)
        possible_moves << growth(pos, [0,1])
      end
      if growth(pos, [1,1]).color == :black
        possible_moves << growth(pos, [1, 1])
      end
      if growth(pos, [-1,1]).color == :black
        possible_moves << growth(pos, [-1, 1])
      end
      
    elsif self.color == :black
      if pos.growth(pos, [0,-1]).is_a?(NullPiece)
        possible_moves << growth(pos, [0,-1])
      end
      if growth(pos, [1,-1]).color == :white
        possible_moves << growth(pos, [1, -1])
      end
      if growth(pos, [-1,-1]).color == :white
        possible_moves << growth(pos, [-1, -1])
      end  
    end
    possible_moves  
  end

end