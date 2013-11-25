require './tile.rb'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9) { Array.new(9) }
    generate_tiles
  end

  def generate_tiles
    @board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        @board[row_idx][col_idx] = Tile.new([row_idx, col_idx])
      end
    end
    @board
  end


end

p new = Board.new.board