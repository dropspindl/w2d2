require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)  
    @board = board
  end 
  
  def render
    (0..7).each do |i|
      puts "\n ------------------------------- \n"
      (0..7).each do |j| 
        position = [i, j]
        if @cursor.cursor_pos == position
          print " #{@board[position].symbol} |".colorize(:red)
        else
          print " #{@board[position].symbol} |"
        end
      end
    
    end
    
  end
  
  def test_cursor
    loop do
      puts "\n \nHere's a new board! \n"
      render
      @cursor.get_input
    end
  end
  
end
