class Piece
  attr_accessor :pos
  
  def initialize(type, pos)
    @type = type
    @pos = pos
  end
  
  def moves 
    @moves = []
  end
  
end

module SlidingPiece
  
  def moves
  end
  
end 

module SteppingPiece 
  
end


class NullPiece < Piece 
  # include Singleton
  def initialize
    @type = nil
    # @pos = pos
  end
  
  def inspect
    print "E"
  end
  
end