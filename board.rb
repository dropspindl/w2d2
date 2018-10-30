require_relative 'piece'

class Board
  attr_accessor :grid, :type
  
  def initialize()
    @grid = Array.new(8){Array.new(8, NullPiece.instance)}
    
    
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
  
  # def empty?
    
  def populate
    # self[[0,0]] = Rook.new(:white, self, [0, 0])
    # @board[0, 7] = Rook.new(:white, self, [0, 7])
    # @board[7, 0] = Rook.new(:black, self, [7, 0])
    # @board[7, 7] = Rook.new(:black, self, [7, 7])
    # 
    # @board[[0][0]] = Knight.new(:white, self, [0, 1])
    # @board[0, 7] = Knight.new(:white, self, [0, 6])
    # @board[7, 0] = Knight.new(:black, self, [7, 1])
    # @board[7, 7] = Knight.new(:black, self, [7, 6])
    royal_row(:white, 0)
    royal_row(:black, 7)
    pawn_row(:white, 1)
    pawn_row(:black, 6)
  end 
  
  def pawn_row(color, row)  
    (0..7).each do |i|
      self[[row, i]] = Pawn.new(color, self, [row, i])
    end
  end 
  
  def royal_row(color, row)
    [0, 7].each do |col| 
      self[[row,col]] = Rook.new(color, self, [row, col])
    end
    
    [1, 6].each do |col| 
      self[[row ,col]] = Knight.new(color, self, [row, col])
    end
    
    [2, 5].each do |col| 
      self[[row, col]] = Bishop.new(color, self, [row, col])
    end
    
    self[[row, 3]] = Queen.new(color, self, [row, 3])
    
    self[[row, 4]] = King.new(color, self, [row, 4])
  end 
  
  def inspect
    "Wee"
  end
    
end
