require_relative 'display.rb'
require_relative 'board.rb'

class Game

  attr_reader :board, :display

  def initialize
   @board = Board.new 
   @board.populate
   @display = Display.new(@board)
 end 


end
