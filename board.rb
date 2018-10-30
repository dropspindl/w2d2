require_relative 'piece'

class Board
  attr_accessor :grid, :type
  
  def initialize()
    @grid = Array.new(8){Array.new(8, "X")}
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]  
  end
  
  def []=(pos, type)
    row, col = pos
    @grid[row][col] = type
  end 
  
  def move_piece(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    raise StandardError if self[start_pos].is_a?(NullPiece)
    raise StandardError if self[end_pos].is_a?(Piece) 
    
  end
end
