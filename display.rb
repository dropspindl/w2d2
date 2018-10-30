require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)  
    @board = board
  end 
  
  def render
    (0..7).each do |i|
      puts "\n --------------------------- \n"
      (0..7).each do |j| 
        position = [i, j]
        if @cursor.cursor_pos == position
          print " #{@board[position]} |".colorize(:red)
        else
          print " #{@board[position]} |"
        end
      end
    
    end
    
  end
  
  def test_cursor
    loop do
      puts "\nHere's a new board! \n"
      render
      c = @cursor.get_input
    end
  end
  
end
